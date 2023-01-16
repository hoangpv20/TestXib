//
//  VideoRecordViewController.swift
//  TestXib
//
//  Created by admin on 12/01/2023.
//

import UIKit

class VideoRecordViewController: UIViewController {
    
    let recordVideoTabbar = RecordVideoTabbar()
    let recordView = MyRecordVideoView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title  = "Video phát lại"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        view.addSubview(recordVideoTabbar)
        recordVideoTabbar.translatesAutoresizingMaskIntoConstraints = false
        recordVideoTabbar.myTabItem[0].myButton.addTarget(self, action: #selector(myRecordVideo), for: .touchUpInside)
        recordVideoTabbar.myTabItem[1].myButton.addTarget(self, action: #selector(myUploadVideo), for: .touchUpInside)
        recordVideoTabbar.myTabItem[0].myButton.setTitleColor(UIColor(patternImage: UIImage(named: "RecordGradientColor")!), for: .normal)
        recordVideoTabbar.footRect2.isHidden = true
        view.addSubview(recordView)
        recordView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
            recordVideoTabbar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            recordVideoTabbar.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
            recordVideoTabbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            recordVideoTabbar.heightAnchor.constraint(equalToConstant: 33),
            
            recordView.topAnchor.constraint(equalTo: view.topAnchor, constant: 149),
            recordView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recordView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recordView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    @objc func myRecordVideo() {
        recordVideoTabbar.myTabItem[0].selectedItem()
        recordVideoTabbar.myTabItem[1].unselectedItem()
        recordVideoTabbar.footRect1.isHidden = false
        recordVideoTabbar.footRect2.isHidden = true
    }
    @objc func myUploadVideo() {
        recordVideoTabbar.myTabItem[0].unselectedItem()
        recordVideoTabbar.myTabItem[1].selectedItem()
        recordVideoTabbar.footRect1.isHidden = true
        recordVideoTabbar.footRect2.isHidden = false
    }
}
