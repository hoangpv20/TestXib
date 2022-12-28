//
//  SecondViewController.swift
//  TestXib
//
//  Created by admin on 22/12/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let itemTVC = BottomSheetViewController()

    @IBOutlet weak var rankingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingButton.addTarget(self, action: #selector(bottomSheet), for: .touchUpInside)
        
    }
    
    @objc func bottomSheet() {
        if let sheet = self.itemTVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        self.present(self.itemTVC, animated: true, completion: nil)
    }
    
    
}

