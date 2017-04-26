//
//  HorizontalButtonStackView.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/24/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

class ButtonWithLabel: UIView {
    
    var id: String = "N/A"
    
    var isSelected = false {
        didSet {
            switch id {
            case "gender":
                background.backgroundColor = isSelected ? Palette.darkHeader.color : Palette.navy.color
            case "interest":
                background.backgroundColor = isSelected ? Palette.grey.color : Palette.lightGrey.color
                label.textColor = isSelected ? Palette.white.color : Palette.grey.color
            case "birthYear":
                background.backgroundColor = isSelected ? Palette.green.color : Palette.aqua.color
            default:
                print("not a valid selection")
            }
        }
    }
   
    let background: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(id: String, backgroundColor: UIColor, textColor: UIColor, textLabel: String) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
        self.id = id
        self.background.backgroundColor = backgroundColor
        self.label.textColor = textColor
        self.label.text = textLabel
        setupBackgroundView()
        setupLabel()
    }
    
    func setupBackgroundView() {
        self.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        background.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupLabel() {
        background.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
    }

}

class HorizontalButtonStackView: UIView {
    
    var stackView: UIStackView!
    var buttons = [ButtonWithLabel]()
    
    var containerForScrollView: UIView!
    var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, textColor: UIColor, textLabels: [String], numberOfViews: Int) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
        //setupContainerForScrollView()
        setupStackView(backgroundColor: backgroundColor, textColor: textColor, textLabels: textLabels, numberOfViews: numberOfViews)
        //setupScrollView()
        setupStackViewConstraints()
    }
    
//    func setupContainerForScrollView() {
//        containerForScrollView = UIView()
//        containerForScrollView.backgroundColor = UIColor.clear
//        
//        self.addSubview(containerForScrollView)
//        containerForScrollView.translatesAutoresizingMaskIntoConstraints = false
//        containerForScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        containerForScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        containerForScrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        containerForScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.black
        scrollView.frame = self.frame
        scrollView.contentSize = self.stackView.frame.size
        self.addSubview(scrollView)
    }
    
    func setupStackView(backgroundColor: UIColor, textColor: UIColor, textLabels: [String], numberOfViews: Int) {
        
        for index in 0...numberOfViews - 1 {
            
            var button: ButtonWithLabel?
            
            switch backgroundColor {
            
            case Palette.navy.color:
                 button = ButtonWithLabel(id: "gender", backgroundColor: backgroundColor, textColor: textColor, textLabel: textLabels[index])
            case Palette.lightGrey.color:
                button = ButtonWithLabel(id: "interest", backgroundColor: backgroundColor, textColor: textColor, textLabel: textLabels[index])
            case Palette.green.color:
                button = ButtonWithLabel(id: "birthYear", backgroundColor: backgroundColor, textColor: textColor, textLabel: textLabels[index])
            default:
                button = nil
            }
            
            if let button = button {
                buttons.append(button)
            }
           
        }

        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
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



