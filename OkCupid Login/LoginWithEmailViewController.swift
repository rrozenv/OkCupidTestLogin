
import UIKit

class LoginWithEmailViewController: UIViewController, UITextFieldDelegate {
    
    fileprivate var emailPasswordView: EmailPasswordView!
    fileprivate var lineDividerView: UIView!
    fileprivate var facebookButton: SignupButton!
    fileprivate var dismissIcon: UIButton!
    
    var didPressLogin: Bool! {
        didSet {
            setupEmailPasswordView()
            setupLineDividerView()
            setupFacebookButton()
            checkIfUserIsSigningUpOrLoggingIn()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupCancelSettingsButton()
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
}

//MARK: Actions

extension LoginWithEmailViewController {
    
    @objc fileprivate func didPressEmailSignUpButton() {
        
        emailPasswordView.signUpButton.backgroundColor = Palette.green.color
        
        guard let email = emailPasswordView.emailTextField.text, let password = emailPasswordView.passwordTextField.text else { print("Form is not valid"); return }
        
        FirebaseManager.createNewUser(email: email, password: password) { (didCreateUser) in
            
            UserDefaults.standard.set(email, forKey: "userEmail")
            
            if didCreateUser {
                let userInfoVC = UserInfoViewController()
                self.present(userInfoVC, animated: true, completion: nil)
            } else {
                //Show error alert
            }
            
        }

    }
    
   @objc fileprivate func didPressEmailLoginButton() {
        
        guard let email = emailPasswordView.emailTextField.text, let password = emailPasswordView.passwordTextField.text else { print("Form is not valid"); return }
        
        FirebaseManager.loginUser(email: email, password: password) { (didLogin) in
            
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            
            if didLogin {
                let signedInVC = SignedInViewController()
                self.present(signedInVC, animated: true, completion: nil)
            } else {
                //Show error alert
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if emailPasswordView.emailTextField.text != nil && emailPasswordView.emailTextField.text != "" {
            emailPasswordView.signUpButton.alpha = 1.0
            emailPasswordView.signUpButton.isEnabled = true
        }
    }
    
    @objc fileprivate func dismissSettingVC() {
        emailPasswordView.emailTextField.resignFirstResponder()
        emailPasswordView.passwordTextField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
}

//MARK: Setup Views

extension LoginWithEmailViewController {
    
    fileprivate func checkIfUserIsSigningUpOrLoggingIn() {
        if didPressLogin {
            emailPasswordView.signUpButton.setTitle("log in", for: .normal)
            emailPasswordView.signUpButton.addTarget(self, action: #selector(didPressEmailLoginButton), for: .touchUpInside)
            emailPasswordView.emailTextField.becomeFirstResponder()
        } else {
            emailPasswordView.signUpButton.setTitle("sign up", for: .normal)
            emailPasswordView.signUpButton.addTarget(self, action: #selector(didPressEmailSignUpButton), for: .touchUpInside)
            emailPasswordView.emailTextField.becomeFirstResponder()
        }
    }
    
    fileprivate func setupEmailPasswordView() {
        emailPasswordView = EmailPasswordView(frame: CGRect.zero)
        emailPasswordView.emailTextField.delegate = self
        emailPasswordView.passwordTextField.delegate = self
        emailPasswordView.signUpButton.alpha = 0.3
        emailPasswordView.signUpButton.isEnabled = false
        
        view.addSubview(emailPasswordView)
        emailPasswordView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailPasswordView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        emailPasswordView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    fileprivate func setupLineDividerView() {
        lineDividerView = UIView()
        lineDividerView.backgroundColor = Palette.lightGrey.color
        lineDividerView.layer.cornerRadius = 2.0
        lineDividerView.layer.masksToBounds = true
        
        view.addSubview(lineDividerView)
        lineDividerView.translatesAutoresizingMaskIntoConstraints = false
        lineDividerView.leadingAnchor.constraint(equalTo: emailPasswordView.leadingAnchor).isActive = true
        lineDividerView.trailingAnchor.constraint(equalTo: emailPasswordView.trailingAnchor).isActive = true
        lineDividerView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        lineDividerView.bottomAnchor.constraint(equalTo: emailPasswordView.topAnchor, constant: -30).isActive = true
    }
    
    fileprivate func setupFacebookButton() {
        if didPressLogin {
            facebookButton = SignupButton(icon: #imageLiteral(resourceName: "IC_facebook"), labelText: "facebook log in", backgroundColor: Palette.navy.color, textColor: UIColor.white)
        } else {
            facebookButton = SignupButton(icon: #imageLiteral(resourceName: "IC_facebook"), labelText: "facebook sign up", backgroundColor: Palette.navy.color, textColor: UIColor.white)
        }
       
        view.addSubview(facebookButton)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.leadingAnchor.constraint(equalTo: emailPasswordView.leadingAnchor).isActive = true
        facebookButton.trailingAnchor.constraint(equalTo: emailPasswordView.trailingAnchor).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        facebookButton.bottomAnchor.constraint(equalTo: lineDividerView.topAnchor, constant: -30).isActive = true
    }
    
    fileprivate func setupCancelSettingsButton() {
        dismissIcon = UIButton()
        dismissIcon.setBackgroundImage(#imageLiteral(resourceName: "IC_Back Arrow Black"), for: .normal)
        
        view.addSubview(dismissIcon)
        dismissIcon.translatesAutoresizingMaskIntoConstraints = false
        dismissIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        dismissIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        dismissIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        dismissIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        dismissIcon.addTarget(self, action: #selector(self.dismissSettingVC), for: .touchUpInside)
    }
    
}
