//
//  User.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/30/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import Firebase


struct User {
    let email: String
    var gender: String
    var interestedIn: String
    let birthYear: String
    
    init(snapshot: FIRDataSnapshot) {
        let dict = snapshot.value as? [String: String]
        self.email = dict?["email"] ?? "No email"
        self.gender = dict?["gender"] ?? "No gender"
        self.interestedIn = dict?["interestedIn"] ?? "No interest"
        self.birthYear = dict?["birthYear"] ?? "No birth year"
    }
}
