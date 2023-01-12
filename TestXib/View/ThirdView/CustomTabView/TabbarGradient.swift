//
//  TabbarGradient.swift
//  TestXib
//
//  Created by admin on 11/01/2023.
//

import UIKit

class TabbarGradient: UIView {
    let myStackView = UIStackView()
    let spacingView = SpacingItem()
    let spacingView2 = SpacingItem()
    var myTabItem = [TabItem]()
    var mySpacingItem = [SpacingItem]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        for _ in 0...2 {
            myTabItem.append(TabItem())
        }
        for _ in 0...1 {
            mySpacingItem.append(SpacingItem())
        }
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
        
        myStackView.addArrangedSubview(myTabItem[0])
        myTabItem[0].changeTitle(title: "Kim cương")
        myTabItem[1].changeTitle(title: "Ruby")
        myTabItem[2].changeTitle(title: "Hoa hồng")
        
        for i in 1...myTabItem.count-1 {
            myStackView.addArrangedSubview(mySpacingItem[i-1])
            myStackView.addArrangedSubview(myTabItem[i])
            NSLayoutConstraint.activate([
                mySpacingItem[i-1].heightAnchor.constraint(equalTo: myStackView.heightAnchor),
                mySpacingItem[i-1].widthAnchor.constraint(equalToConstant: 0.5),
                
                myTabItem[i].heightAnchor.constraint(equalTo: myStackView.heightAnchor),
                myTabItem[i].widthAnchor.constraint(equalTo: myTabItem[0].widthAnchor),
            ])
        }
        
        let constraint = [
            myStackView.topAnchor.constraint(equalTo: topAnchor),
            myStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            myStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            myTabItem[0].heightAnchor.constraint(equalTo: myStackView.heightAnchor),
            myTabItem[0].widthAnchor.constraint(equalToConstant: (frame.size.width-CGFloat((mySpacingItem.count))*0.5)/CGFloat(myTabItem.count)),
            
        ]
        NSLayoutConstraint.activate(constraint)
    }

}
