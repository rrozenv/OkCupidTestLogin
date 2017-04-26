//
//  FirebaseManager.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/24/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import Firebase

final class FirebaseManager {
    
    static let ref = FIRDatabase.database().reference()
    static let usersRef = FIRDatabase.database().reference(withPath: "users")
    
    class func createNewUser(email: String, password: String, completion: @escaping (Bool) -> ()) {
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print("Error: \(error). Could not create user.")
                completion(false)
            }
            
            guard let user = user else { return }
            let reference = usersRef.child(user.uid)
            let values = ["email": email]
            reference.updateChildValues(values)
            completion(true)
        })
    }
    
    class func loginUser(email: String, password:String, completion: @escaping (Bool) -> ()) {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print("Error: \(error). Could not login user.")
                completion(false)
            }
            
            if let user = user {
                print("EXISTING USER: \(user), SIGNED IN!")
                completion(true)
            }
            
        })
    }
    
}
