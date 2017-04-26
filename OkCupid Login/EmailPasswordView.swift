//
//  EmailPasswordView.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/22/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

class EmailPasswordView: UIView {
    
    lazy var viewWidth: CGFloat = UIScreen.main.bounds.width //375
    lazy var viewHeight: CGFloat = UIScreen.main.bounds.height //667
    
    var stackView: UIStackView!
    
    let emailTextField: TextField = {
        let tf = TextField()
        tf.placeholder = "Email"
        tf.backgroundColor = Palette.lightGrey.color
        tf.layer.cornerRadius = 4.0
        tf.layer.masksToBounds = true
        tf.font = UIFont(name: "Avenir-Medium", size: 14.0)
        tf.textColor = Palette.grey.color
        return tf
    }()
    
    let passwordTextField: TextField = {
        let tf = TextField()
        tf.placeholder = "Password"
        tf.backgroundColor = Palette.lightGrey.color
        tf.layer.cornerRadius = 4.0
        tf.layer.masksToBounds = true
        tf.font = UIFont(name: "Avenir-Medium", size: 14.0)
        tf.textColor = Palette.grey.color
        return tf
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Palette.aqua.color
        button.setTitle("sign up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupStackViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        let views = [emailTextField, passwordTextField, signUpButton] as [Any]
        stackView = UIStackView(arrangedSubviews: views as! [UIView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15
    }
    
    func setupStackViewConstraints() {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}


class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
}
