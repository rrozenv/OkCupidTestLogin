//
//  BirthYearCell.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/26/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

final class Year {
    let yearText: String
    var isSelected = false
    
    init(_ text: String) {
        self.yearText = text
    }
}

class BirthYearCell: UICollectionViewCell {
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir-Medium", size: 14.0)
        return label
    }()
    
    var year: Year! {
        didSet {
            yearLabel.text = year.yearText
            yearIsSelected = year.isSelected
        }
    }
    
    var yearIsSelected: Bool = false {
        didSet {
            contentView.backgroundColor = yearIsSelected ?  Palette.birthYearDark.color : Palette.birthYearLight.color
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        yearLabel.text = nil
    }
    
    private func commonInit() {
        contentView.backgroundColor = Palette.birthYearLight.color
        contentView.addSubview(yearLabel)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        yearLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func deselectCell() {
        contentView.backgroundColor = Palette.birthYearLight.color
    }

}
