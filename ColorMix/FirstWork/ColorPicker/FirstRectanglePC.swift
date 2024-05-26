//
//  FirstRectanglePC.swift
//  ColorMix
//
//  Created by Drolllted on 19.05.2024.
//

import UIKit

class FirstRectanglePC: UIColorPickerViewController{
    
    static var identifire = "static"
    
    weak var delegateColor: MixColorVCDelegate?
    
    lazy var pickerColorFirst: UIColorPickerViewController = {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        
        return picker
    }()
}

extension FirstRectanglePC: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
        viewController.dismiss(animated: true)
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        delegateColor?.setFirstColor(color: color)
    }
    
}
