
import Foundation
import UIKit

enum Palette {
    
    case pink, lightBlue, aqua, grey, lightGrey, white, darkHeader, salmon, green, navy, purple, darkText, darkPurple, yellow, genderBlue, interestPurpleLight, interestPurpleDark, birthYearLight, birthYearDark
    
    var color: UIColor {
        switch self {
        case .pink: return UIColor(hex: 0xFFDCE5)
        case .lightBlue: return UIColor(hex: 0x92C6D0)
        case .aqua: return UIColor(hex: 0x4FD8D1)
        case .grey: return UIColor(hex: 0xA5A5A5)
        case .white: return UIColor(hex: 0xffffff)
        case .lightGrey: return UIColor(hex: 0xF4F4F4)
        case .darkHeader: return UIColor(hex: 0x0A0A0A)
        case .salmon: return UIColor(hex: 0xFF8484)
        case .green: return UIColor(hex: 0x35CE8D)
        case .navy: return UIColor(hex: 0x385C75)
        case .purple: return UIColor(hex: 0x7D8CC4)
        case .darkText: return UIColor(hex: 0x515151)
        case .darkPurple: return UIColor(hex: 0x475279)
        case .yellow: return UIColor(hex: 0xF8F4AD)
        case .genderBlue: return UIColor(hex: 0x8FA8BA)
        case .interestPurpleLight: return UIColor(hex: 0xDFD7F8)
        case .interestPurpleDark: return UIColor(hex: 0x6E628E)
        case .birthYearLight: return UIColor(hex: 0xB7DEE5)
        case .birthYearDark: return UIColor(hex: 0x598E97)
        }
    }
}

extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    class func forGradient(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
    
}
