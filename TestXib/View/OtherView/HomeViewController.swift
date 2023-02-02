//
//  HomeViewController.swift
//  TestXib
//
//  Created by admin on 31/01/2023.
//

import UIKit

class HomeViewController: UIViewController {
    let gradienrScreen = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gradienrScreen)
        gradienrScreen.translatesAutoresizingMaskIntoConstraints = false
        gradienrScreen.image = UIImage(named: "GradientScreen")
        let constraint = [
            gradienrScreen.topAnchor.constraint(equalTo: view.topAnchor),
            gradienrScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradienrScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradienrScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }

}
