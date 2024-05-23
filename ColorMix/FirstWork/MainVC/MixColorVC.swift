//
//  ViewController.swift
//  ColorMix
//
//  Created by Drolllted on 19.05.2024.
//

import UIKit

protocol MixColorVCDelegate: AnyObject {
    func setFirstColor(color: UIColor)
    func setSecondColor(color: UIColor)
}

class MixColorVC: UIViewController {
    
    private var mixColor: MixColor!
    
    private var firstPC = FirstRectanglePC()
    private var secondPC = SecondRectanglePC()
    
    override func loadView() {
        mixColor = MixColor()
        view = mixColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MixColor"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold)]
        
        view.backgroundColor = .systemBackground
        
        mixColor.firstRectangleColor.addTarget(self, action: #selector(colorFirst), for: .touchUpInside)
        mixColor.secondRectangleColor.addTarget(self, action: #selector(colorSecond), for: .touchUpInside)
    }
    
    //MARK: - objc func
    
    @objc func colorFirst() {
        let picker = firstPC
        picker.delegateColor = self
        
        self.present(self.firstPC.pickerColorFirst, animated: true)
        
        mixThirdColor()
    }
    
    @objc func colorSecond(){
        let picker = secondPC
        picker.delegateColor = self
        
        self.present(self.secondPC.pickerColorSecond, animated: true)
        
        mixThirdColor()
    }
 
    
    func mixThirdColor() {
        guard let color1 = mixColor.firstRectangleColor.backgroundColor,
              let color2 = mixColor.secondRectangleColor.backgroundColor else {return }
        
        let mixColorForFinal = UIColor.mixColor(color1, color2)
        
        mixColor.mixColorView.backgroundColor = mixColorForFinal
    }
    
}


extension MixColorVC: MixColorVCDelegate{
    func setSecondColor(color: UIColor) {
        mixColor.secondRectangleColor.backgroundColor = color
    }
    
    func setFirstColor(color: UIColor) {
        mixColor.firstRectangleColor.backgroundColor = color
    }
    
    
}

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
