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
    private var apiCaller = NetworkData.shared
    
    private var tapperFirstButton = false
    private var currentIndex = 0
    
    private var firstPC = FirstRectanglePC()
    private var secondPC = SecondRectanglePC()
    
    override func loadView() {
        mixColor = MixColor()
        view = mixColor
    }
    
    // dependency injection (Внедрение зависимости)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MixColor"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.white]
        
        view.backgroundColor = .black
        
        mixColor.firstRectangleColor.addTarget(self, action: #selector(colorFirst), for: .touchUpInside)
        mixColor.secondRectangleColor.addTarget(self, action: #selector(colorSecond), for: .touchUpInside)
        mixColor.ravLabel.addTarget(self, action: #selector(mixThirdRectangleColor), for: .touchUpInside)
        
    }
    
    //MARK: - objc func
    
    @objc func colorFirst() {
        
        let picker = firstPC
        picker.delegateColor = self
        
        self.present(self.firstPC.pickerColorFirst, animated: true)
        
        guard let firstColor = mixColor.firstRectangleColor.backgroundColor else {return}
        fetchNameColor(firstColor, tappedFirst: true)
    }
    
    @objc func colorSecond(){
        let picker = secondPC
        picker.delegateColor = self
        
        self.present(self.secondPC.pickerColorSecond, animated: true)
        guard let secondColor = mixColor.secondRectangleColor.backgroundColor else {return}
        fetchNameColor(secondColor, tappedFirst: false)
    }
    
    @objc func mixThirdRectangleColor() {
        guard let color1 = mixColor.firstRectangleColor.backgroundColor,
              let color2 = mixColor.secondRectangleColor.backgroundColor else {return }
        
        let mixColorForFinal = UIColor.mixColor(color1, color2)
        
        mixColor.mixColorView.backgroundColor = mixColorForFinal
        
        fetchNameColor(mixColorForFinal,tappedFirst: false ,isResult: true)
    }
 
    //MARK: - functions
    
    func fetchNameColor(_ color: UIColor, tappedFirst: Bool ,isResult: Bool = false) {
        func getColor(fromColor: UIColor) -> String {
            let rgbComponents = "\(color.redValue.description),\(color.greenValue.description),\(color.blueValue.description)"
            return rgbComponents
        }
        apiCaller.getColorsCalled(rgb: getColor(fromColor: color)) {[weak self] colorName in
            DispatchQueue.main.async{
                if let colorName = colorName{
                    if isResult{
                        self?.mixColor.finalNameTextLabel.text = colorName
                    } else if tappedFirst{
                        self?.mixColor.textNameLabelFirst.text = colorName
                        self?.currentIndex = 1
                    }else{
                        self?.mixColor.textNameLabelSecond.text = colorName
                        self?.currentIndex = 0
                    }
                }
            }
        }
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
