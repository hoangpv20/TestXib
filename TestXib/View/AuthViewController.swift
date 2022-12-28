//
//  AuthViewController.swift
//  TestXib
//
//  Created by admin on 22/12/2022.
//

import UIKit

class AuthViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "My VC"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        let rightButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftAction))
        
        let rightButton1 = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItems = [rightButton, rightButton1]
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    @objc func leftAction() {
        print("tapedd")
    }
    
    @IBAction func authButtonDidTap(_ sender: Any) {
        let secodController = SecondViewController()
        
        navigationController?.pushViewController(secodController, animated: true)
    }
    
}
