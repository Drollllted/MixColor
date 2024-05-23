//
//  MixColor.swift
//  ColorMix
//
//  Created by Drolllted on 19.05.2024.
//

import UIKit

class MixColor: UIView{
    
    //MARK: - Properties
    
    //MARK: - Create UIModels
    
    lazy var textNameLabelFirst: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Nice-nice"
        label.textColor = .black
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var firstRectangleColor: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .green
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return button
    }()
    
    lazy var plusLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var textNameLabelSecond: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Nice-nice"
        label.textColor = .black
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var secondRectangleColor: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .green
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return button
    }()
    
    lazy var ravLabel: UILabel = {
        let label = UILabel()
        label.text = "="
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var finalNameTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Nice-nice"
        label.textColor = .black
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var mixColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    //MARK: - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setNameLabelfirstRectangle()
        
        setFirstRectangleView()
        
        setPlusLabel()
        
        setNameLabelSecondRectangle()
        
        setSecondRectangleView()
        
        setRavLabel()
        
        setFinalNameLabel()
        
        setFinalColorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Obj-c Models
    
    
    
    //MARK: - Setup UIModels
    
    private func setNameLabelfirstRectangle() {
        addSubview(textNameLabelFirst)
        
        NSLayoutConstraint.activate([
            textNameLabelFirst.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 45),
            textNameLabelFirst.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setFirstRectangleView() {
        addSubview(firstRectangleColor)
        
        NSLayoutConstraint.activate([
            firstRectangleColor.topAnchor.constraint(equalTo: textNameLabelFirst.bottomAnchor, constant: 5),
            firstRectangleColor.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setPlusLabel() {
        addSubview(plusLabel)
        
        NSLayoutConstraint.activate([
            plusLabel.topAnchor.constraint(equalTo: firstRectangleColor.bottomAnchor, constant: 50),
            plusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setNameLabelSecondRectangle() {
        addSubview(textNameLabelSecond)
        
        NSLayoutConstraint.activate([
            textNameLabelSecond.topAnchor.constraint(equalTo: plusLabel.bottomAnchor, constant: 45),
            textNameLabelSecond.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setSecondRectangleView() {
        addSubview(secondRectangleColor)
        
        NSLayoutConstraint.activate([
            secondRectangleColor.topAnchor.constraint(equalTo: textNameLabelSecond.bottomAnchor, constant: 5),
            secondRectangleColor.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setRavLabel() {
        addSubview(ravLabel)
        
        NSLayoutConstraint.activate([
            ravLabel.topAnchor.constraint(equalTo: secondRectangleColor.bottomAnchor, constant: 50),
            ravLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setFinalNameLabel() {
        addSubview(finalNameTextLabel)
        
        NSLayoutConstraint.activate([
            finalNameTextLabel.topAnchor.constraint(equalTo: ravLabel.bottomAnchor, constant: 45),
            finalNameTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setFinalColorView() {
        addSubview(mixColorView)
        
        NSLayoutConstraint.activate([
            mixColorView.topAnchor.constraint(equalTo: finalNameTextLabel.bottomAnchor, constant: 5),
            mixColorView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
