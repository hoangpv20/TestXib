//
//  ConclusionView.swift
//  TestXib
//
//  Created by admin on 31/01/2023.
//

import UIKit

class ConclusionView: UIView {
    let conclusionStackView = UIStackView()
    var myConclusionItem = [ConclusionItem]()
    var mySpacingItem = [ConclusionSpacing]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        for _ in 0...3 {
            myConclusionItem.append(ConclusionItem())
        }
        for _ in 0...(myConclusionItem.count - 2) {
            mySpacingItem.append(ConclusionSpacing())
        }
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        backgroundColor = .clear
        conclusionStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(conclusionStackView)
        conclusionStackView.distribution = UIStackView.Distribution.fill
        
        myConclusionItem[0].setValue(value: "126", object: "Follower")
        myConclusionItem[1].setValue(value: "16", object: "Following")
        myConclusionItem[2].setValueImage(value: "30k", image: "DiamondConclusion", object: "Kim cương")
        myConclusionItem[3].setValueImage(value: "15,6K", image: "RubyConclusion", object: "Ruby")
        
        conclusionStackView.addArrangedSubview(myConclusionItem[0])
        
        for i in 1...myConclusionItem.count-1 {
            conclusionStackView.addArrangedSubview(mySpacingItem[i-1])
            conclusionStackView.addArrangedSubview(myConclusionItem[i])
            NSLayoutConstraint.activate([
                mySpacingItem[i-1].heightAnchor.constraint(equalTo: conclusionStackView.heightAnchor),
                mySpacingItem[i-1].widthAnchor.constraint(equalTo: conclusionStackView.widthAnchor, multiplier: 16.67/329),
                
                myConclusionItem[i].heightAnchor.constraint(equalTo: conclusionStackView.heightAnchor),
                myConclusionItem[i].widthAnchor.constraint(equalTo: conclusionStackView.widthAnchor, multiplier: 78/329),
            ])
        }
        
        let constraint = [
            conclusionStackView.topAnchor.constraint(equalTo: topAnchor),
            conclusionStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            conclusionStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            conclusionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            myConclusionItem[0].heightAnchor.constraint(equalTo: conclusionStackView.heightAnchor),
            myConclusionItem[0].widthAnchor.constraint(equalTo: conclusionStackView.widthAnchor, multiplier: 45/329),
        ]
        NSLayoutConstraint.activate(constraint)
        
        
    }
}
