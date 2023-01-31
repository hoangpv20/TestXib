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
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = .black
        rankingButton.addTarget(self, action: #selector(bottomSheet), for: .touchUpInside)
    }
    
    @objc func bottomSheet() {
        if let sheet = self.itemTVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        self.present(self.itemTVC, animated: true, completion: nil)
    }
    
    @IBAction func topUpAction(_ sender: Any) {
        let thirdViewController = ThirdViewController()
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
    @IBAction func livestreamCenterAction(_ sender: Any) {
        let personalViewController = TabbarViewController()
        navigationController?.pushViewController(personalViewController, animated: true)
    }
    
}

