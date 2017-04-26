//
//  SignUpWithFacebookView.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/22/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

final class SignupButton: UIView {
    
    var iconAndLablStackView: UIStackView!
    
    let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = 4.0
        backgroundView.layer.masksToBounds = true
        return backgroundView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 13.0)
        return label
    }()
    
    let icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(icon: UIImage, labelText: String, backgroundColor: UIColor, textColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.icon.image = icon
        self.label.text = labelText
        self.backgroundView.backgroundColor = backgroundColor
        self.label.textColor = textColor
        setupBackgroundView()
        setupIconImage()
        setupLabel()
    }
    
    func setupBackgroundView() {
        self.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupIconImage() {
        icon.contentMode = .scaleAspectFit
        backgroundView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        icon.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    func setupLabel() {
        backgroundView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    }
    
}
