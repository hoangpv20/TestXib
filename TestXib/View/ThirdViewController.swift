//
//  ThirdViewController.swift
//  TestXib
//
//  Created by admin on 29/12/2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let gradientScreen = UIImageView()
    let footerGradient = UIImageView()
    let myDiamond = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title  = "18 live +"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        view.addSubview(gradientScreen)
        gradientScreen.translatesAutoresizingMaskIntoConstraints = false
        gradientScreen.addSubview(footerGradient)
        footerGradient.translatesAutoresizingMaskIntoConstraints = false
        gradientScreen.addSubview(myDiamond)
        myDiamond.translatesAutoresizingMaskIntoConstraints = false
        
        gradientScreen.image = UIImage(named: "GradientScreen")
        footerGradient.image = UIImage(named: "FooterGradient")
        myDiamond.image = UIImage(named: "MyDiamondFrame")
        
    let constraint = [
        gradientScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        gradientScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        gradientScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        gradientScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        
        footerGradient.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        footerGradient.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        footerGradient.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
        footerGradient.heightAnchor.constraint(equalToConstant: 512),
        
        myDiamond.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        myDiamond.topAnchor.constraint(equalTo: view.topAnchor, constant: 149),
        myDiamond.heightAnchor.constraint(equalToConstant: 103),
        myDiamond.widthAnchor.constraint(equalToConstant: 343)
    ]
        NSLayoutConstraint.activate(constraint)
    }
}
