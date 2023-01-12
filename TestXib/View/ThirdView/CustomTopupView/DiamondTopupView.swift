//
//  DiamondTopupView.swift
//  TestXib
//
//  Created by admin on 12/01/2023.
//

import UIKit

class DiamondTopupView: UIView {
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
        
    }

}
