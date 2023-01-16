//
//  RecordVideoTabItem.swift
//  TestXib
//
//  Created by admin on 16/01/2023.
//

import UIKit

class RecordVideoTabItem: UIView {
    let myButton = UIButton()
    let footRect = UIImageView()

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
        myButton.setTitleColor(UIColor(named: "UnselectedTextColor"), for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.titleLabel?.font = UIFont(name: "Sarabun-Medium", size: 16)
        addSubview(myButton)
        
        let constraint = [
            myButton.topAnchor.constraint(equalTo: topAnchor),
            myButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            myButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            myButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func changeTitle(title: String) {
        myButton.setTitle(title, for: .normal)
    }
    func selectedItem() {
        let gradientText = UIImage.gradientImage(bounds: myButton.bounds, colors: [UIColor(named: "StartColorTextGradient")!, UIColor(named: "EndColorTextGradient")!])
        myButton.setTitleColor(UIColor(patternImage: gradientText), for: .normal)
    }
    func unselectedItem() {
        myButton.setTitleColor(UIColor(named: "UnselectedTextColor"), for: .normal)
    }

}
