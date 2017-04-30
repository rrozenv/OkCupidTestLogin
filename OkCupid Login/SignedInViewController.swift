
import UIKit

class SignedInViewController: UIViewController {
    
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        FirebaseManager.fetchCurrentUser { (user) in
            self.currentUser = user
        }
    }

}
