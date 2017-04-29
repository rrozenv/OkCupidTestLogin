
import Foundation
import UIKit

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



