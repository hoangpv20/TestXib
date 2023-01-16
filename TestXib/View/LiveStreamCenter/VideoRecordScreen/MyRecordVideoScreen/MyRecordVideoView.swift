//
//  MyRecordVideoView.swift
//  TestXib
//
//  Created by admin on 16/01/2023.
//

import UIKit

class MyRecordVideoView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let myRecordTable = UITableView()
    let data: [Record] = [
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
        Record(subcript: "Upload up to eight 7-inch tablet screenshots. Screen shots must be", time: "15:30  08/03/2022"),
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
        
        myRecordTable.allowsSelection = false
        myRecordTable.backgroundColor = .clear
        
        backgroundColor = .clear
        myRecordTable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(myRecordTable)
        myRecordTable.dataSource = self
        myRecordTable.delegate = self
        myRecordTable.register(UINib(nibName: "MyRecordTableViewCell", bundle: nil), forCellReuseIdentifier: "MyRecordTableViewCell")
        
        let constraint = [
            myRecordTable.topAnchor.constraint(equalTo: topAnchor),
            myRecordTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            myRecordTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            myRecordTable.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = data[indexPath.row]
        let cell = myRecordTable.dequeueReusableCell(withIdentifier: "MyRecordTableViewCell") as! MyRecordTableViewCell
        cell.loadData(item: record)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

}
struct Record {
    var subcript: String
    var time: String
}
