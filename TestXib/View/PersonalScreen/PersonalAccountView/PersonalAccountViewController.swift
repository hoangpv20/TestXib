//
//  PersonalAccountViewController.swift
//  TestXib
//
//  Created by admin on 17/01/2023.
//

import UIKit

class PersonalAccountViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let humanButton = UIButton()
    let settingButton = UIButton()
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
    let tableView1 = UITableView()
    
    let data1: [[Activity]] = [
    [Activity(imageName: "Icon1", activityName: "Tin nhắn", hiddenCircle: false),
    Activity(imageName: "Icon2", activityName: "Nhiệm vụ", hiddenCircle: false),
    Activity(imageName: "Icon3", activityName: "Bảng xếp hạng", hiddenCircle: true),
    Activity(imageName: "Icon4", activityName: "Mini game", hiddenCircle: true)],
    [
    Activity(imageName: "Icon5", activityName: "Level người dùng", hiddenCircle: true),
    Activity(imageName: "Icon6", activityName: "Túi đồ", hiddenCircle: true),
    Activity(imageName: "Icon7", activityName: "Ví tiền", hiddenCircle: true),
    Activity(imageName: "Icon8", activityName: "VIP", hiddenCircle: true),
    Activity(imageName: "Icon9", activityName: "Nhóm Fan", hiddenCircle: true)
    ],
    [
    Activity(imageName: "Icon10", activityName: "Ý kiến phản hồi", hiddenCircle: true),
    Activity(imageName: "Icon11", activityName: "Giới thiệu về chúng tôi", hiddenCircle: true),
    ],
    [
    Activity(imageName: "Icon12", activityName: "Đăng xuất", hiddenCircle: true),
    ]
    ]
    
    let sections = ["", "", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = .black
        
        view.addSubview(humanButton)
        humanButton.setBackgroundImage(UIImage(named: "HumanIcon"), for: .normal)
        humanButton.translatesAutoresizingMaskIntoConstraints = false
        humanButton.addTarget(self, action: #selector(humanAction), for: .touchUpInside)
        
        view.addSubview(settingButton)
        settingButton.setBackgroundImage(UIImage(named: "SettingIcon"), for: .normal)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.addTarget(self, action: #selector(settingAction), for: .touchUpInside)
        
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
        noteLabel.font = UIFont(name: "Sarabun-Regular", size: 12)
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
        
        view.addSubview(tableView1)
        tableView1.backgroundColor = .clear
        tableView1.separatorStyle = .none
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.layer.cornerRadius = 10.0
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.register(UINib(nibName: "PersonalAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalAccountTableViewCell")
        
        
        let constraint = [
            humanButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            humanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            
            settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 54),
            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            
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
            
            tableView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 354),
            tableView1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48)

            
        ]
        NSLayoutConstraint.activate(constraint)
        
    }
    @objc func personalAction() {
    }
    @objc func humanAction() {
    }
    @objc func settingAction() {
        let settingViewController = SettingViewController()
        navigationController?.pushViewController(settingViewController, animated: true)
    }
    @objc func liveCenterAction() {
        let livestreamCenterViewController = LivestreamCenterViewController()
        navigationController?.pushViewController(livestreamCenterViewController, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data1[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: "PersonalAccountTableViewCell") as? PersonalAccountTableViewCell
        let activity = self.data1[indexPath.section][indexPath.row]
        cell!.loadActivity(acitivity: activity)
        cell!.insertNumber(number: indexPath)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cornerRadius = 8.0
        var corners: UIRectCorner = []
        if indexPath.row == 0 {
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        }
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        }
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        cell.layer.mask = maskLayer
    }
}
struct Activity {
    var imageName: String
    var activityName: String
    var hiddenCircle: Bool
}
