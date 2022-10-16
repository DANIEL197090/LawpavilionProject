//
//  ColorEnum.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//

import Foundation
import UIKit
var systemColor : UIColor {
    return UIColor { (trait) -> UIColor in
        switch trait.userInterfaceStyle {
        case .dark:
            return AppColors.black.color
        default:
            return  AppColors.white.color
        }
    }
}
var textSystemColor : UIColor {
    return UIColor { (trait) -> UIColor in
        switch trait.userInterfaceStyle {
        case .dark:
            return AppColors.white.color
        default:
            return  AppColors.black.color
        }
    }
}
// MARK: - ... Enum for holding colors to be used throughout the app
enum AppColors {
    case white
    case greenColor
    case black
    case placeholderColor
    case lightGreenColor
    case darkerGray
    var color: UIColor {
        switch self {
        case .white:
            return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        case .greenColor:
            return UIColor(red: 0.43, green: 0.75, blue: 0.33, alpha: 1.00)
        case .black:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        case .placeholderColor:
            return  UIColor(red: 0.56, green: 0.56, blue: 0.57, alpha: 1.00)
        case .lightGreenColor:
            return  UIColor(red: 0.84, green: 0.96, blue: 0.89, alpha: 1.00)
        case .darkerGray:
            return  UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00)
        }
    }
}
