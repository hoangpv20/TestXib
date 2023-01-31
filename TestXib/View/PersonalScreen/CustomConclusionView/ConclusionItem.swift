//
//  ConclusionItem.swift
//  TestXib
//
//  Created by admin on 31/01/2023.
//

import UIKit

class ConclusionItem: UIView {
    let valueLabel = UILabel()
    let objectLabel = UILabel()
    let objectIcon = UIImageView()
    let valueStack = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        backgroundColor = .clear
        addSubview(objectLabel)
        valueLabel.font = UIFont(name: "Sarabun-SemiBold", size: 16)
        objectLabel.translatesAutoresizingMaskIntoConstraints = false
        objectLabel.textColor = UIColor(named: "ActivityNameColor")
        objectLabel.font = UIFont(name: "Sarabun-Medium", size: 12)
        objectLabel.textColor = UIColor(named: "UnselectedTextColor")
        
        valueStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(valueStack)
        valueStack.addArrangedSubview(valueLabel)
        valueStack.addArrangedSubview(objectIcon)
        valueStack.spacing = 2
        
        let constraint = [
            valueStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueStack.topAnchor.constraint(equalTo: topAnchor),
            
            objectLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            objectLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func setValue(value: String, object: String) {
        valueLabel.text = value
        objectLabel.text = object
    }
    func setValueImage(value: String, image: String, object: String) {
        valueLabel.text = value
        objectIcon.image = UIImage(named: image)
        objectLabel.text = object
    }
    
}
