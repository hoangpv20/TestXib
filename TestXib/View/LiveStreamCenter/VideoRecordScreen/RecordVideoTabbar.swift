//
//  RecordVideoTabbar.swift
//  TestXib
//
//  Created by admin on 16/01/2023.
//

import UIKit

class RecordVideoTabbar: UIView {
    
    let myStackView = UIStackView()
    let footRect1 = UIImageView()
    let footRect2 = UIImageView()
    var myTabItem = [RecordVideoTabItem]()
    var mySpacingItem = [SpacingItem]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        for _ in 0...1 {
            myTabItem.append(RecordVideoTabItem())
        }
        for _ in 0...(myTabItem.count - 2) {
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
        footRect1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(footRect1)
        footRect1.image = UIImage(named: "StreamRecordFootRect")
        footRect2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(footRect2)
        footRect2.image = UIImage(named: "StreamRecordFootRect")
        
        myStackView.addArrangedSubview(myTabItem[0])
        myTabItem[0].changeTitle(title: "Bản ghi video")
        myTabItem[1].changeTitle(title: "Video đã đăng")
        myTabItem[0].myButton.contentHorizontalAlignment = .left
        myTabItem[1].myButton.contentHorizontalAlignment = .right
        
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
            myStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            myStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            footRect1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            footRect1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            footRect1.heightAnchor.constraint(equalToConstant: 2),
            footRect2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            footRect2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44),
            footRect2.heightAnchor.constraint(equalToConstant: 2),
            
            myTabItem[0].heightAnchor.constraint(equalTo: myStackView.heightAnchor),
            myTabItem[0].widthAnchor.constraint(equalToConstant: (frame.size.width-CGFloat((mySpacingItem.count))*0.5)/CGFloat(myTabItem.count)),
            
        ]
        NSLayoutConstraint.activate(constraint)
    }
}
