//
//  PersonalAccountViewController.swift
//  TestXib
//
//  Created by admin on 17/01/2023.
//

import UIKit

class PersonalAccountViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let avtImage = UIImageView()
    let userName = UILabel()
    let idStackView = UIStackView()
    let userId = UILabel()
    let copyButton = UIButton()
    let buttonStackView = UIStackView()
    let eventbutton = UIButton()
    let liveCenterButton = UIButton()
    let noteLabel = UILabel()
    let conclusionView = ConclusionView()
    let myScrollView = UIScrollView()
    let myStackView = UIStackView()
    let tableView1 = UITableView()
    let tableView2 = UITableView()
    let tableView3 = UITableView()
    let tableView4 = UITableView()
    
    let data1: [Activity] = [
    Activity(imageName: "Icon1", activityName: "Tin nhắn"),
    Activity(imageName: "Icon2", activityName: "Nhiệm vụ"),
    Activity(imageName: "Icon3", activityName: "Bảng xếp hạng"),
    Activity(imageName: "Icon4", activityName: "Mini game")
    ]
    
    let data2: [Activity] = [
    Activity(imageName: "Icon5", activityName: "Level người dùng"),
    Activity(imageName: "Icon6", activityName: "Túi đồ"),
    Activity(imageName: "Icon7", activityName: "Ví tiền"),
    Activity(imageName: "Icon8", activityName: "VIP"),
    Activity(imageName: "Icon9", activityName: "Nhóm Fan")
    ]
    
    let data3: [Activity] = [
    Activity(imageName: "Icon10", activityName: "Ý kiến phản hồi"),
    Activity(imageName: "Icon11", activityName: "Giới thiệu về chúng tôi"),
    ]
    
    let data4: [Activity] = [
    Activity(imageName: "Icon12", activityName: "Đăng xuất"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = .black
        
//        let rightButton1 = UIBarButtonItem(image: UIImage(named: "HumanIcon")!, style: .plain, target: self, action: #selector(humanAction))
//        let rightButton2 = UIBarButtonItem(image: UIImage(named: "SettingIcon")!, style: .plain, target: self, action: #selector(settingAction))
//        navigationItem.rightBarButtonItems = [rightButton1, rightButton2]
        
        let button1 = UIButton(type: .custom)
        button1.setImage(UIImage(named: "HumanIcon"), for: .normal)
        button1.addTarget(self, action: #selector(humanAction), for: .touchUpInside)
        button1.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let barButton1 = UIBarButtonItem()
        barButton1.customView = button1
        self.navigationItem.rightBarButtonItem = barButton1
        
        view.addSubview(avtImage)
        avtImage.image = UIImage(named: "AvtCircle")
        avtImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userName)
        userName.text = "Diana Alasia Non"
        userName.font = UIFont(name: "Sarabun-Medium", size: 16)
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(idStackView)
        idStackView.translatesAutoresizingMaskIntoConstraints = false
        idStackView.addArrangedSubview(userId)
        idStackView.addArrangedSubview(copyButton)
        idStackView.distribution = UIStackView.Distribution.fill
        idStackView.spacing = 8.0
        userId.text = "Id: 12346877"
        userId.font = UIFont(name: "Sarabun-Regular", size: 12)
        userId.textColor = UIColor(named: "UserIdColor")
        copyButton.setTitle("Copy", for: .normal)
        copyButton.backgroundColor = UIColor(named: "CopyButtonBackgroud")
        copyButton.setTitleColor(UIColor(named: "CopyButtonText"), for: .normal)
        copyButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 12)
        
        view.addSubview(conclusionView)
        conclusionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(noteLabel)
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.text = "Hoàn thành hồ sơ cá nhân để tận hưởng nhiều lợi ích hơn nhé"
        noteLabel.textAlignment = .center
        noteLabel.textColor = UIColor(named: "IconImage")
        noteLabel.font = UIFont(name: "Sarabun-Regular", size: 14)
        noteLabel.backgroundColor = UIColor(named: "NoteColor")
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.addArrangedSubview(eventbutton)
        buttonStackView.addArrangedSubview(liveCenterButton)
        buttonStackView.distribution = UIStackView.Distribution.fillEqually
        buttonStackView.spacing = 13.0
        eventbutton.setBackgroundImage(UIImage(named: "EventButton"), for: .normal)
        liveCenterButton.setBackgroundImage(UIImage(named: "LiveCenterButton"), for: .normal)
        liveCenterButton.addTarget(self, action: #selector(liveCenterAction), for: .touchUpInside)
        
        view.addSubview(myScrollView)
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        myScrollView.backgroundColor = .clear
        
        myScrollView.addSubview(myStackView)
        myStackView.axis = .vertical
        myStackView.spacing = 8
        myStackView.backgroundColor = .clear
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.allowsSelection = false
        tableView1.register(UINib(nibName: "PersonalAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalAccountTableViewCell")
        
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.allowsSelection = false
        tableView2.register(UINib(nibName: "PersonalAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalAccountTableViewCell")
        
        tableView3.delegate = self
        tableView3.dataSource = self
        tableView3.allowsSelection = false
        tableView3.register(UINib(nibName: "PersonalAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalAccountTableViewCell")
        
        tableView4.delegate = self
        tableView4.dataSource = self
        tableView4.allowsSelection = false
        tableView4.register(UINib(nibName: "PersonalAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalAccountTableViewCell")
        
        myStackView.addArrangedSubview(tableView1)
        myStackView.addArrangedSubview(tableView2)
        myStackView.addArrangedSubview(tableView3)
        myStackView.addArrangedSubview(tableView4)
        
        
        let constraint = [
            avtImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            avtImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            userName.topAnchor.constraint(equalTo: avtImage.bottomAnchor,constant: 8),
            
            idStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            idStackView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 6),
            
            copyButton.widthAnchor.constraint(equalToConstant: 45),
            copyButton.heightAnchor.constraint(equalToConstant: 19),
            
            conclusionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
            conclusionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conclusionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            conclusionView.heightAnchor.constraint(equalToConstant: 41),
            
            noteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            noteLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 188),
            noteLabel.heightAnchor.constraint(equalToConstant: 34),
            noteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            buttonStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 295),
            buttonStackView.heightAnchor.constraint(equalToConstant: 43),
            
            myScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 354),
            myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
            
            myStackView.topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: 0),
            myStackView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor, constant: 0),
            myStackView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor, constant: 0),
            myStackView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor, constant: 0),
            myStackView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor),
            
            tableView1.widthAnchor.constraint(equalTo: myStackView.widthAnchor),
            tableView1.heightAnchor.constraint(equalToConstant: 192),
            
            tableView2.widthAnchor.constraint(equalTo: myStackView.widthAnchor),
            tableView2.heightAnchor.constraint(equalToConstant: 240),
            
            tableView3.widthAnchor.constraint(equalTo: myStackView.widthAnchor),
            tableView3.heightAnchor.constraint(equalToConstant: 96),
            
            tableView4.widthAnchor.constraint(equalTo: myStackView.widthAnchor),
            tableView4.heightAnchor.constraint(equalToConstant: 48),
            
        ]
        NSLayoutConstraint.activate(constraint)
        
    }
    @objc func personalAction() {
        
    }
    @objc func humanAction() {
        
    }
    @objc func settingAction() {
        
    }
    @objc func liveCenterAction() {
        let livestreamCenterViewController = LivestreamCenterViewController()
        navigationController?.pushViewController(livestreamCenterViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        if tableView == self.tableView1 {
            count = data1.count
        }
        if tableView == self.tableView2 {
            count = data2.count
        }
        if tableView == self.tableView3 {
            count = data3.count
        }
        if tableView == self.tableView4 {
            count = data4.count
        }
        return count!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView1, let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalAccountTableViewCell") as? PersonalAccountTableViewCell {
            let activity = data1[indexPath.row]
            cell.loadActivity(acitivity: activity)
            return cell
        } else if tableView == tableView2, let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalAccountTableViewCell") as? PersonalAccountTableViewCell {
            let activity = data2[indexPath.row]
            cell.loadActivity(acitivity: activity)
            return cell
        } else if tableView == tableView3, let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalAccountTableViewCell") as? PersonalAccountTableViewCell {
            let activity = data3[indexPath.row]
            cell.loadActivity(acitivity: activity)
            return cell
        } else if tableView == tableView4, let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalAccountTableViewCell") as? PersonalAccountTableViewCell {
            let activity = data4[indexPath.row]
            cell.loadActivity(acitivity: activity)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
struct Activity {
    let imageName: String
    let activityName: String
}
