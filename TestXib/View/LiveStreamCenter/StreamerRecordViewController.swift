//
//  StreamerRecordViewController.swift
//  TestXib
//
//  Created by admin on 12/01/2023.
//

import UIKit

class StreamerRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "Trung tâm phát trực tiếp"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }


}
