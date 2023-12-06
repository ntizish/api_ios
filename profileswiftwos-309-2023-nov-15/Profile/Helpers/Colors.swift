//
//  Colors.swift
//  Profile
//
import UIKit

enum Colors: String, CaseIterable, Codable, Equatable {
    case white = "#e0eff0"
    case darkblue = "#104767"
    
    var uiColor: UIColor {
        return UIColor(rgb: self.rawValue)!
    }
}
