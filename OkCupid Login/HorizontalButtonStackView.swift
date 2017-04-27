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
    
    var isSelected = false {
        didSet {
            background.backgroundColor = isSelected ? backgroundColors[id]?.selected : backgroundColors[id]?.notSelected
        }
    }
    
    private let backgroundColors = ["gender":(selected: Palette.navy.color, notSelected: Palette.genderBlue.color), "interest": (selected: Palette.interestPurpleDark.color, notSelected: Palette.interestPurpleLight.color), "birthYear": (selected: Palette.birthYearDark.color, notSelected: Palette.birthYearLight.color)]

    private var id: String = "N/A"
   
    private let background: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        return view
    }()
    
    private let label: UILabel = {
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
    
    private func setupBackgroundView() {
        self.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        background.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setupLabel() {
        background.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
    }

}

class HorizontalButtonStackView: UIView {
    
    var views = [ButtonWithLabel]()
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, textColor: UIColor, textLabels: [String], numberOfViews: Int) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
        setupStackView(backgroundColor: backgroundColor, textColor: textColor, textLabels: textLabels, numberOfViews: numberOfViews)
        setupStackViewConstraints()
    }
    
    private func setupStackView(backgroundColor: UIColor, textColor: UIColor, textLabels: [String], numberOfViews: Int) {
        
        for index in 0...numberOfViews - 1 {
            
            var button: ButtonWithLabel?
    
            switch backgroundColor {
            
            case Palette.genderBlue.color:
                 button = ButtonWithLabel(id: "gender", backgroundColor: backgroundColor, textColor: textColor, textLabel: textLabels[index])
            case Palette.interestPurpleLight.color:
                button = ButtonWithLabel(id: "interest", backgroundColor: backgroundColor, textColor: textColor, textLabel: textLabels[index])
            case Palette.birthYearLight.color:
                button = ButtonWithLabel(id: "birthYear", backgroundColor: backgroundColor, textColor: textColor, textLabel: textLabels[index])
            default:
                button = nil
            }
            
            if let button = button {
                views.append(button)
            }
           
        }

        stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
    }
    
    private func setupStackViewConstraints() {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}



