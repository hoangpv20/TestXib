//
//  SecondViewController.swift
//  TestXib
//
//  Created by admin on 22/12/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let itemTVC = BottomSheetViewController()
    let mainImage = UIImageView()

    @IBOutlet weak var rankingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingButton.addTarget(self, action: #selector(bottomSheet), for: .touchUpInside)
//        view.addSubview(mainImage)
//        mainImage.translatesAutoresizingMaskIntoConstraints = false
//        mainImage.image = UIImage(named: "mainScreen")
//        mainImage.bringSubviewToFront(rankingButton)
//
//        let constraint = [
//            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//        ]
//        NSLayoutConstraint.activate(constraint)
    }
    
    @objc func bottomSheet() {
        if let sheet = self.itemTVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        self.present(self.itemTVC, animated: true, completion: nil)
    }
    
    
}

