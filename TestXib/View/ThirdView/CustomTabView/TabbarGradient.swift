//
//  TabbarGradient.swift
//  TestXib
//
//  Created by admin on 11/01/2023.
//

import UIKit

class TabbarGradient: UIView {
    let myStackView = UIStackView()
    let diamondTabView = TabItem()
    let rubyTabView = TabItem()
    let roseTabView = TabItem()
    let spacingView = UIView()
    let spacingView2 = UIView()
    
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
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(myStackView)
        myStackView.distribution = UIStackView.Distribution.fill
        myStackView.spacing = 0
        
        myStackView.addArrangedSubview(diamondTabView)
        diamondTabView.translatesAutoresizingMaskIntoConstraints = false
        diamondTabView.changeTitle(title: "Kim cương")
        
        myStackView.addArrangedSubview(spacingView)
        spacingView.translatesAutoresizingMaskIntoConstraints = false
        
        spacingView.backgroundColor = .black
        myStackView.addArrangedSubview(rubyTabView)
        rubyTabView.translatesAutoresizingMaskIntoConstraints = false
        rubyTabView.changeTitle(title: "Ruby")
        
        myStackView.addArrangedSubview(spacingView2)
        spacingView2.translatesAutoresizingMaskIntoConstraints = false
        
        spacingView2.backgroundColor = .black
        myStackView.addArrangedSubview(roseTabView)
        roseTabView.translatesAutoresizingMaskIntoConstraints = false
        roseTabView.changeTitle(title: "Hoa hồng")
        
        let constraint = [
            myStackView.topAnchor.constraint(equalTo: topAnchor),
            myStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            myStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            diamondTabView.heightAnchor.constraint(equalTo: myStackView.heightAnchor),
            diamondTabView.widthAnchor.constraint(equalToConstant: (frame.size.width-1)/3),
            
            spacingView.heightAnchor.constraint(equalTo: myStackView.heightAnchor),
            spacingView.widthAnchor.constraint(equalToConstant: 0.5),
            
            rubyTabView.heightAnchor.constraint(equalTo: myStackView.heightAnchor),
            rubyTabView.widthAnchor.constraint(equalTo: diamondTabView.widthAnchor),
            
            spacingView2.heightAnchor.constraint(equalTo: myStackView.heightAnchor),
            spacingView2.widthAnchor.constraint(equalToConstant: 0.5),
            
            roseTabView.heightAnchor.constraint(equalTo: myStackView.heightAnchor),
            roseTabView.widthAnchor.constraint(equalTo: diamondTabView.widthAnchor),
        ]
        NSLayoutConstraint.activate(constraint)
    }

}
