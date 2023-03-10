//
//  VideoRecordViewController.swift
//  TestXib
//
//  Created by admin on 12/01/2023.
//

import UIKit

class VideoRecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data: [Record] = [
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
    ]
    let data1: [Upload] = [
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
    ]
        
    let recordVideoTabbar = RecordVideoTabbar()
    let recordView = UIView()
    let uploadView = UIView()
    let myRecordTableView = UITableView()
    let myUploadTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title  = "Video phát lại"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = .black
        
        view.addSubview(recordVideoTabbar)
        recordVideoTabbar.translatesAutoresizingMaskIntoConstraints = false
        recordVideoTabbar.myTabItem[0].myButton.addTarget(self, action: #selector(myRecordVideo), for: .touchUpInside)
        recordVideoTabbar.myTabItem[1].myButton.addTarget(self, action: #selector(myUploadVideo), for: .touchUpInside)
        recordVideoTabbar.myTabItem[0].myButton.setTitleColor(UIColor(patternImage: UIImage(named: "RecordGradientColor")!), for: .normal)
        recordVideoTabbar.footRect2.isHidden = true
        
        view.addSubview(recordView)
        recordView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadView)
        uploadView.translatesAutoresizingMaskIntoConstraints = false
        uploadView.isHidden = true
        
        myRecordTableView.backgroundColor = .clear
        recordView.addSubview(myRecordTableView)
        myRecordTableView.translatesAutoresizingMaskIntoConstraints = false
        myRecordTableView.dataSource = self
        myRecordTableView.delegate = self
        myRecordTableView.register(UINib(nibName: "MyRecordTableViewCell", bundle: nil), forCellReuseIdentifier: "MyRecordTableViewCell")
        
        myUploadTableView.backgroundColor = .clear
        uploadView.addSubview(myUploadTableView)
        myUploadTableView.translatesAutoresizingMaskIntoConstraints = false
        myUploadTableView.delegate = self
        myUploadTableView.dataSource = self
        myUploadTableView.register(UINib(nibName: "MyUploadTableViewCell", bundle: nil), forCellReuseIdentifier: "MyUploadTableViewCell")
        
        let constraint = [
            recordVideoTabbar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            recordVideoTabbar.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
            recordVideoTabbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            recordVideoTabbar.heightAnchor.constraint(equalToConstant: 33),

            recordView.topAnchor.constraint(equalTo: view.topAnchor, constant: 149),
            recordView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recordView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recordView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            uploadView.topAnchor.constraint(equalTo: view.topAnchor, constant: 149),
            uploadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uploadView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uploadView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            myRecordTableView.topAnchor.constraint(equalTo: recordView.topAnchor),
            myRecordTableView.leadingAnchor.constraint(equalTo: recordView.leadingAnchor),
            myRecordTableView.trailingAnchor.constraint(equalTo: recordView.trailingAnchor),
            myRecordTableView.bottomAnchor.constraint(equalTo: recordView.bottomAnchor),
            
            myUploadTableView.topAnchor.constraint(equalTo: uploadView.topAnchor),
            myUploadTableView.leadingAnchor.constraint(equalTo: uploadView.leadingAnchor),
            myUploadTableView.trailingAnchor.constraint(equalTo: uploadView.trailingAnchor),
            myUploadTableView.bottomAnchor.constraint(equalTo: uploadView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        
        if tableView == self.myRecordTableView {
            count = data.count
        }
        if tableView == self.myUploadTableView {
            count = data1.count
        }
        return count!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = data[indexPath.row]
        let upload = data1[indexPath.row]
        if tableView == self.myUploadTableView {
            let cell = myUploadTableView.dequeueReusableCell(withIdentifier: "MyUploadTableViewCell") as! MyUploadTableViewCell
            cell.loadData(item: upload)
            return cell
        } else {
            let cell = myRecordTableView.dequeueReusableCell(withIdentifier: "MyRecordTableViewCell") as! MyRecordTableViewCell
            cell.loadData1(item: record)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editDescVC = EditDescriptViewController()
        if tableView == self.myRecordTableView {
        myRecordTableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(editDescVC, animated: true)
        } else {
            myUploadTableView.deselectRow(at: indexPath, animated: true)
            self.navigationController?.pushViewController(editDescVC, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @objc func myRecordVideo() {
        recordVideoTabbar.myTabItem[0].selectedItem()
        recordVideoTabbar.myTabItem[1].unselectedItem()
        recordVideoTabbar.footRect1.isHidden = false
        recordVideoTabbar.footRect2.isHidden = true
        recordView.isHidden = false
        uploadView.isHidden = true
    }
    @objc func myUploadVideo() {
        recordVideoTabbar.myTabItem[0].unselectedItem()
        recordVideoTabbar.myTabItem[1].selectedItem()
        recordVideoTabbar.footRect1.isHidden = true
        recordVideoTabbar.footRect2.isHidden = false
        recordView.isHidden = true
        uploadView.isHidden = false
    }
}
struct Record {
    var subcript: String
    var time: String
}
struct Upload {
    var subcript: String
    var time: String
}
