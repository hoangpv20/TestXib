//
//  TabItem.swift
//  TestXib
//
//  Created by admin on 11/01/2023.
//

import UIKit

class TabItem: UIView {
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
        myButton.setTitleColor(.black, for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        addSubview(myButton)
        myButton.addSubview(footRect)
        footRect.translatesAutoresizingMaskIntoConstraints = false
        footRect.image = UIImage(named: "FooterRectangle")
        let constraint = [
            myButton.topAnchor.constraint(equalTo: topAnchor),
            myButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            myButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            myButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            footRect.centerXAnchor.constraint(equalTo: myButton.centerXAnchor),
            footRect.bottomAnchor.constraint(equalTo: myButton.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func changeTitle(title: String) {
        myButton.setTitle(title, for: .normal)
    }
    func selectedItem() {
        footRect.isHidden = false
        myButton.setTitleColor(.red, for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Sarabun-SemiBold", size: 14)
    }
    func unselectedItem() {
        footRect.isHidden = true
        myButton.setTitleColor(.black, for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
    }

}
