
import Foundation
import UIKit

class ButtonWithLabel: UIButton {
    
    var didSelect = false {
        didSet {
            self.backgroundColor = didSelect ? backgroundColors[id]?.selected : backgroundColors[id]?.notSelected
        }
    }
    
    private let backgroundColors = ["gender":(selected: Palette.navy.color, notSelected: Palette.genderBlue.color), "interest": (selected: Palette.interestPurpleDark.color, notSelected: Palette.interestPurpleLight.color), "birthYear": (selected: Palette.birthYearDark.color, notSelected: Palette.birthYearLight.color)]
    
    private var id: String = "N/A"
    
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
        self.id = id
        self.backgroundColor = backgroundColor
        self.label.textColor = textColor
        self.label.text = textLabel
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = true
        setupLabel()
    }
    
    private func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
