
import Foundation
import UIKit

final class SignupButton: UIButton {
    
    private var iconAndLablStackView: UIStackView!
    
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
    
    override init(frame: CGRect) { super.init(frame: frame) }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    init(icon: UIImage, labelText: String, backgroundColor: UIColor, textColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.icon.image = icon
        self.label.text = labelText
        self.backgroundColor = backgroundColor
        self.label.textColor = textColor
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        setupIconImage()
        setupLabel()
    }
    
    private func setupIconImage() {
        icon.contentMode = .scaleAspectFit
        
        self.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    private func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
