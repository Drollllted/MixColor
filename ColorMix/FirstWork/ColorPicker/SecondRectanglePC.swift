//
//  SecondRectanglePC.swift
//  ColorMix
//
//  Created by Drolllted on 19.05.2024.
//

import UIKit

class SecondRectanglePC: UIColorPickerViewController{
    weak var delegateColor: MixColorVCDelegate?
    
    lazy var pickerColorSecond: UIColorPickerViewController = {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        
        return picker
    }()
}

extension SecondRectanglePC: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        delegateColor?.setSecondColor(color: color)
        viewController.dismiss(animated: true)
    }
}
