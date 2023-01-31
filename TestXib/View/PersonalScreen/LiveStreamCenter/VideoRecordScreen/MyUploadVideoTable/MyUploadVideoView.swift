//
//  MyUploadVideoView.swift
//  TestXib
//
//  Created by admin on 16/01/2023.
//

import UIKit

class MyUploadVideoView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let uploadTableView = UITableView()
    let data: [Upload] = [
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Upload(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        backgroundColor = .clear
        uploadTableView.backgroundColor = .clear
        uploadTableView.allowsSelection = false
        
        addSubview(uploadTableView)
        uploadTableView.translatesAutoresizingMaskIntoConstraints = false
        uploadTableView.delegate = self
        uploadTableView.dataSource = self
        uploadTableView.register(UINib(nibName: "MyUploadTableViewCell", bundle: nil), forCellReuseIdentifier: "MyUploadTableViewCell")
        
        let constraint = [
            uploadTableView.topAnchor.constraint(equalTo: topAnchor),
            uploadTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            uploadTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            uploadTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let upload = data[indexPath.row]
        let cell = uploadTableView.dequeueReusableCell(withIdentifier: "MyUploadTableViewCell") as! MyUploadTableViewCell
        cell.loadData(item: upload)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
struct Upload {
    var subcript: String
    var time: String
}
