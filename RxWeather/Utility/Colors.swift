//
//  Utility.swift
//  RxWeather
//
//  Created by Mohammad Assad on 7/5/2022.
//

import Foundation
import UIKit

struct Colors {
    
    let screenColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case  .unspecified,.light:
            return .white
        case .dark:
            return .black
        @unknown default:
            return .black
        }
    }
    
    
    let defaultColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case  .unspecified,.light:
            return .black
        case .dark:
            return .white
        @unknown default:
            return .black
        }
    }
    
    let tempColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case  .unspecified,.light:
            return .lightGray
        case .dark:
            return .lightGray
        @unknown default:
            return .black
        }
    }
}

