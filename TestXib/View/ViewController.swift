//
//  ViewController.swift
//  TestXib
//
//  Created by admin on 22/12/2022.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet private weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "First VC"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        myButton.setTitle("Button", for: .normal)

    }
    
    @objc func leftAction(){
        print("taped")
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        let viewController = AuthViewController()
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
