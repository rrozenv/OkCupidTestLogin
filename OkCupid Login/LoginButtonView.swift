//
//  LoginButtonView.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/22/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

class LoginButtonView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        label.textColor = Palette.grey.color
        return label
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = Palette.lightGrey.color
        return line
    }()
    
    override init(frame: CGRect) { super.init(frame: frame) }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    init(labelText: String) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
        self.label.text = labelText
        setupLineView()
        setupLabel()
    }
    
    func setupLineView() {
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        line.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

}
