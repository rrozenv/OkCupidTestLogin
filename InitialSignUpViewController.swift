
import UIKit
import SpriteKit

final class InitialSignUpViewController: UIViewController {
    
    fileprivate var loginButtonView: LoginButtonView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didPressLogIn))
            loginButtonView.addGestureRecognizer(gesture)
        }
    }
    
    fileprivate var emailSignupButton: SignupButton! {
        didSet {
            emailSignupButton.addTarget(self, action: #selector(didPressSignupWithEmail), for: .touchUpInside)
        }
    }
    
    fileprivate var facebookSignupButton: SignupButton! {
        didSet {
            //TODO: Create Facebook Signup action
        }
    }
    
    fileprivate var logoView: LogoView!
    fileprivate var chatBubbleImageView: UIImageView!
    fileprivate var chatBubbleLeadingAnchor: NSLayoutConstraint!
    fileprivate var moleculeImageView: UIImageView!
    fileprivate var moleculeImageTrailingAnchor: NSLayoutConstraint!
    fileprivate var sloganImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupLogoBackground()
        setupChatBubbleImageView()
        setupMoleculeImageView()
        setupSloganImageView()
        animateChatBubbleImageView()
        animateMoleculeImageView()
        animateSloganImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLoginButtonView()
        setupEmailSignupButton()
        setupFacebookSignupButton()
        startParticleAnimation()
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
}

//MARK: Actions

extension InitialSignUpViewController {
    
    @objc fileprivate func didPressLogIn() {
        let emailVC = LoginWithEmailViewController()
        emailVC.didPressLogin = true
        present(emailVC, animated: true, completion: nil)
    }
    
    @objc fileprivate func didPressSignupWithEmail() {
        emailSignupButton.backgroundColor = Palette.grey.color
        let emailVC = LoginWithEmailViewController()
        emailVC.didPressLogin = false
        present(emailVC, animated: true, completion: nil)
    }
    
}

//MARK: Animations

extension InitialSignUpViewController {
    
    fileprivate func animateChatBubbleImageView() {
        self.view.layoutIfNeeded()
        self.chatBubbleLeadingAnchor.constant = -30
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    fileprivate func animateMoleculeImageView() {
        self.view.layoutIfNeeded()
        self.moleculeImageTrailingAnchor.constant = 20
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    fileprivate func animateSloganImageView() {
        self.view.layoutIfNeeded()
        self.sloganImageView.alpha = 1.0
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    fileprivate func startParticleAnimation() {
        let particleColors = [Palette.yellow.color, Palette.lightBlue.color, Palette.pink.color]
        let position = CGPoint(x: DeviceSize.viewWidth * (185/375), y: DeviceSize.viewHeight * (183/667))
        let particleSize = CGSize(width: 3, height: 3)
        if let image = UIImage(named: "IC_heartParticle")?.cgImage {
            let emmitter = ParticleEmitterLayer(colors: particleColors, position: position, size: particleSize, image: image)
            view.layer.addSublayer(emmitter)
        } else {
            print("Could not create particles.")
        }
    }
    
}

//MARK: Setup Views

extension InitialSignUpViewController {
    
    fileprivate func setupLogoBackground() {
        logoView = LogoView()
        logoView.circleBackground.layer.cornerRadius = DeviceSize.viewHeight * (60/667)
        logoView.circleBackground.layer.masksToBounds = true
        
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: DeviceSize.viewHeight * (140/667)).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (120/667)).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (120/667)).isActive = true
    }
    
    fileprivate func setupChatBubbleImageView() {
        chatBubbleImageView = UIImageView()
        chatBubbleImageView.image = #imageLiteral(resourceName: "IC_heartMessage")
        
        view.insertSubview(chatBubbleImageView, aboveSubview: logoView)
        chatBubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        chatBubbleImageView.topAnchor.constraint(equalTo: logoView.topAnchor).isActive = true
        chatBubbleLeadingAnchor = chatBubbleImageView.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: DeviceSize.viewHeight * (200/667))
        chatBubbleLeadingAnchor.isActive = true
        chatBubbleImageView.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (45/667)).isActive = true
        chatBubbleImageView.widthAnchor.constraint(equalToConstant: DeviceSize.viewWidth * (52/375)).isActive = true
    }
    
    fileprivate func setupMoleculeImageView() {
        moleculeImageView = UIImageView()
        moleculeImageView.image = #imageLiteral(resourceName: "IC_molecule")
        
        view.insertSubview(moleculeImageView, aboveSubview: logoView)
        moleculeImageView.translatesAutoresizingMaskIntoConstraints = false
        moleculeImageView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        moleculeImageTrailingAnchor = moleculeImageView.trailingAnchor.constraint(equalTo: logoView.leadingAnchor, constant: -DeviceSize.viewHeight * (200/667))
        moleculeImageTrailingAnchor.isActive = true
        moleculeImageView.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (43/667)).isActive = true
        moleculeImageView.widthAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (43/667)).isActive = true
    }
    
    fileprivate func setupSloganImageView() {
        sloganImageView = UIImageView()
        sloganImageView.contentMode = .scaleAspectFit
        sloganImageView.image = #imageLiteral(resourceName: "IC_madnessText")
        sloganImageView.alpha = 0
        
        view.addSubview(sloganImageView)
        sloganImageView.translatesAutoresizingMaskIntoConstraints = false
        sloganImageView.widthAnchor.constraint(equalToConstant: 230).isActive = true
        sloganImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sloganImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sloganImageView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40).isActive = true
    }
    
    fileprivate func setupLoginButtonView() {
        loginButtonView = LoginButtonView(labelText: "Log In")
        
        view.addSubview(loginButtonView)
        loginButtonView.translatesAutoresizingMaskIntoConstraints = false
        loginButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginButtonView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        loginButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    fileprivate func setupEmailSignupButton() {
        let emailIcon = UIImage(named: "IC_email")
        emailSignupButton = SignupButton(icon: emailIcon!, labelText: "email sign up", backgroundColor: Palette.lightGrey.color, textColor: Palette.grey.color)
        
        view.addSubview(emailSignupButton)
        emailSignupButton.translatesAutoresizingMaskIntoConstraints = false
        emailSignupButton.bottomAnchor.constraint(equalTo: loginButtonView.topAnchor, constant: -30).isActive = true
        emailSignupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailSignupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailSignupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    fileprivate func setupFacebookSignupButton() {
        let fbIcon = UIImage(named: "IC_facebook")
        facebookSignupButton = SignupButton(icon: fbIcon!, labelText: "facebook sign up", backgroundColor: Palette.navy.color, textColor: UIColor.white)
        
        view.addSubview(facebookSignupButton)
        facebookSignupButton.translatesAutoresizingMaskIntoConstraints = false
        facebookSignupButton.bottomAnchor.constraint(equalTo: emailSignupButton.topAnchor, constant: -15).isActive = true
        facebookSignupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        facebookSignupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        facebookSignupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
