
import UIKit

/*
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var loginButton: LoginButtonView!
    var emailPasswordView: EmailPasswordView!
    var lineDividerView: UIView!
    //var facebookButton: SignUpWithFacebookView!
    
    var emailPasswordViewBottomConstraint: NSLayoutConstraint!
    var textFieldPressedCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupLoginButtonView()
        setupEmailPasswordView()
        setupLineDividerView()
        setupFacebookButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension LoginViewController {
    
    
    func setupLoginButtonView() {
        loginButton = LoginButtonView(labelText: "Log In")
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupEmailPasswordView() {
        emailPasswordView = EmailPasswordView(frame: CGRect.zero)
        emailPasswordView.emailTextField.delegate = self
        emailPasswordView.passwordTextField.delegate = self
        
        emailPasswordView.signUpButton.alpha = 0.3
        emailPasswordView.signUpButton.isEnabled = false
        //emailPasswordView.signUpButton.addTarget(self, action: #selector(didPressEmailSignUpButton), for: .touchUpInside)
        
        view.addSubview(emailPasswordView)
        emailPasswordView.translatesAutoresizingMaskIntoConstraints = false
        emailPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailPasswordView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        emailPasswordViewBottomConstraint = emailPasswordView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30)
        emailPasswordViewBottomConstraint.isActive = true
    }
    
    func setupLineDividerView() {
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

    func setupFacebookButton() {
        let icon = UIImage(named: "IC_facebookIcon")
        facebookButton = SignUpWithFacebookView(icon: icon!, labelText: "sign up with facebook")
        
        view.addSubview(facebookButton)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.leadingAnchor.constraint(equalTo: emailPasswordView.leadingAnchor).isActive = true
        facebookButton.trailingAnchor.constraint(equalTo: emailPasswordView.trailingAnchor).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        facebookButton.bottomAnchor.constraint(equalTo: lineDividerView.topAnchor, constant: -30).isActive = true
    }
    
}

extension LoginViewController {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if emailPasswordView.emailTextField.text != nil && emailPasswordView.emailTextField.text != "" {
            emailPasswordView.signUpButton.alpha = 1.0
            emailPasswordView.signUpButton.isEnabled = true
        }
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if textFieldPressedCounter <= 1 {
            adjustingHeight(true, notification: notification)
            textFieldPressedCounter += 1
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if textFieldPressedCounter != 1 {
            adjustingHeight(false, notification: notification)
            textFieldPressedCounter = 1
        }
    }
    
    func adjustingHeight(_ show: Bool, notification: Notification) {
        var userInfo = notification.userInfo!
        let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let changeInHeight = (keyboardFrame.height - 50) * (show ? -1 : 1)
        self.emailPasswordViewBottomConstraint.constant += changeInHeight
        self.view.layoutIfNeeded()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
 */

