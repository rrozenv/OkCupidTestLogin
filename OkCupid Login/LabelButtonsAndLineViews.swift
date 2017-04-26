//
//  LabelButtonsAndLineViews.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/24/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

class LabelButtonsAndLineViews: UIView {
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = Palette.lightGrey.color
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(labelText: String) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
    }

}
