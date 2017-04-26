//
//  logoView.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/23/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

final class LogoView: UIView {
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "IC_okcupidLogo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let potionImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "IC_lovePotion")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let circleBackground: UIView = {
        let circle = UIView()
        circle.backgroundColor = Palette.lightBlue.color
        circle.layer.borderWidth = 3
        circle.layer.borderColor = Palette.navy.color.cgColor
        return circle
    }()
    
    let bubbleOne: UIView = {
        let circle = UIView()
        circle.alpha = 0
        circle.backgroundColor = Palette.salmon.color
        return circle
    }()
    
    let bubbleTwo: UIView = {
        let circle = UIView()
        circle.alpha = 0
        circle.backgroundColor = Palette.salmon.color
        return circle
    }()
    
    let bubbleThree: UIView = {
        let circle = UIView()
        circle.alpha = 0
        circle.backgroundColor = Palette.salmon.color
        return circle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
        setupCircleBackground()
        setupLogo()
        setupPotionImageView()
        //setupBubbles()
        //animateBubbles()
    }
    
    func animateBubbles() {
        let duration = 2.0
        let delay = 0.0
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: [.repeat, .autoreverse] , animations: {
       
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                self.bubbleOne.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                self.bubbleTwo.alpha = 0.8
                self.bubbleOne.alpha = 0.4
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                self.bubbleThree.alpha = 0.4
                self.bubbleTwo.alpha = 0.2
            })
            
        }, completion: nil)
    }
    
    func setupCircleBackground() {
        self.addSubview(circleBackground)
        circleBackground.translatesAutoresizingMaskIntoConstraints = false
        circleBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        circleBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        circleBackground.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        circleBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupLogo() {
        self.insertSubview(logoImageView, aboveSubview: circleBackground)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 9).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 38).isActive = true
    }
    
    func setupPotionImageView() {
        circleBackground.addSubview(potionImageView)
        potionImageView.translatesAutoresizingMaskIntoConstraints = false
        potionImageView.bottomAnchor.constraint(equalTo: circleBackground.bottomAnchor, constant: -8).isActive = true
        potionImageView.centerXAnchor.constraint(equalTo: circleBackground.centerXAnchor).isActive = true
        potionImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        potionImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupBubbles() {
        bubbleOne.layer.cornerRadius = 5
        bubbleOne.layer.masksToBounds = true
        circleBackground.addSubview(bubbleOne)
        bubbleOne.translatesAutoresizingMaskIntoConstraints = false
        bubbleOne.bottomAnchor.constraint(equalTo: potionImageView.topAnchor, constant: -3).isActive = true
        bubbleOne.centerXAnchor.constraint(equalTo: potionImageView.centerXAnchor, constant: -4).isActive = true
        bubbleOne.heightAnchor.constraint(equalToConstant: 10).isActive = true
        bubbleOne.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        bubbleTwo.layer.cornerRadius = 4
        bubbleTwo.layer.masksToBounds = true
        circleBackground.addSubview(bubbleTwo)
        bubbleTwo.translatesAutoresizingMaskIntoConstraints = false
        bubbleTwo.bottomAnchor.constraint(equalTo: bubbleOne.topAnchor, constant: -3).isActive = true
        bubbleTwo.centerXAnchor.constraint(equalTo: potionImageView.centerXAnchor, constant: 4).isActive = true
        bubbleTwo.heightAnchor.constraint(equalToConstant: 8).isActive = true
        bubbleTwo.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
        bubbleThree.layer.cornerRadius = 3
        bubbleThree.layer.masksToBounds = true
        circleBackground.addSubview(bubbleThree)
        bubbleThree.translatesAutoresizingMaskIntoConstraints = false
        bubbleThree.bottomAnchor.constraint(equalTo: bubbleTwo.topAnchor, constant: -3).isActive = true
        bubbleThree.centerXAnchor.constraint(equalTo: potionImageView.centerXAnchor, constant: -4).isActive = true
        bubbleThree.heightAnchor.constraint(equalToConstant: 6).isActive = true
        bubbleThree.widthAnchor.constraint(equalToConstant: 6).isActive = true
    }

    
    
}
