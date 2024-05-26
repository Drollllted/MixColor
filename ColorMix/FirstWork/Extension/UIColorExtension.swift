//
//  UIColorExtension.swift
//  ColorMix
//
//  Created by Drolllted on 26.05.2024.
//

import UIKit

extension UIColor{
    static func mixColor(_ color1: UIColor, _ color2: UIColor) -> UIColor{
        var redColor1: CGFloat = 0
        var greenColor1: CGFloat = 0
        var blueColor1: CGFloat = 0
        var alpha1: CGFloat = 0
        
        var redColor2: CGFloat = 0
        var greenColor2: CGFloat = 0
        var blueColor2: CGFloat = 0
        var alpha2: CGFloat = 0
        
        color1.getRed(&redColor1, green: &greenColor1, blue: &blueColor1, alpha: &alpha1)
        color2.getRed(&redColor2, green: &greenColor2, blue: &blueColor2, alpha: &alpha2)
        
        let mixColor = UIColor(red: ((redColor1 + redColor2) / 2), green: ((greenColor1 + greenColor2) / 2), blue: ((blueColor1 + blueColor2) / 2), alpha: ((alpha1 + alpha2) / 2))
        
        return mixColor
    }
}
