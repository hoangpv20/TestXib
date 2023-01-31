//
//  ConclusionSpacing.swift
//  TestXib
//
//  Created by admin on 31/01/2023.
//

import UIKit

class ConclusionSpacing: UIView {
    let lineImage = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    func setupView() {
        backgroundColor = .clear
        addSubview(lineImage)
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        lineImage.image = UIImage(named: "Line")
        
        let constraint = [
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }

}
