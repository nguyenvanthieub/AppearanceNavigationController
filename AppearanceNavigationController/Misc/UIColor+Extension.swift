//
//  UIColor+Random.swift
//  AppearanceNavigationController
//
//  Created by zen on 28/10/15.
//  Copyright © 2015 Zen. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    // used solution from http://stackoverflow.com/a/29806108/4405316
    var brightness: CGFloat {
        let colorSpace = CGColorGetColorSpace(CGColor)
        let colorSpaceModel = CGColorSpaceGetModel(colorSpace)
        
        var brightness: CGFloat = 0.0
        if colorSpaceModel == .RGB {
            let components = CGColorGetComponents(CGColor)
            brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        } else {
            getWhite(&brightness, alpha: nil)
        }
        
        return brightness
    }
    
    var isBright: Bool {
        return brightness > 0.5
    }
    
    var inversedColor: UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(red: 1 - red, green: 1 - green, blue: 1 - blue, alpha: alpha)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(
            red: CGFloat(arc4random_uniform(255)) / 255,
            green: CGFloat(arc4random_uniform(255)) / 255,
            blue: CGFloat(arc4random_uniform(255)) / 255,
            alpha: CGFloat(arc4random_uniform(100)) / 100
        )
    }
}