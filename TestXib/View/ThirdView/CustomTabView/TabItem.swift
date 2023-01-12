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
        myButton.setTitleColor(UIColor(named: "DiamondTextColor"), for: .normal)
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
        let gradientText = UIImage.gradientImage(bounds: myButton.bounds, colors: [UIColor(named: "StartColorTextGradient")!, UIColor(named: "EndColorTextGradient")!])
        myButton.setTitleColor(UIColor(patternImage: gradientText), for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Sarabun-SemiBold", size: 14)
    }
    func unselectedItem() {
        footRect.isHidden = true
        myButton.setTitleColor(UIColor(named: "DiamondTextColor"), for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
    }
}
extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
