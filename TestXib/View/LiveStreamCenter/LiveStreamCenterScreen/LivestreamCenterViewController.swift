//
//  LivestreamCenterViewController.swift
//  TestXib
//
//  Created by admin on 12/01/2023.
//

import UIKit

class LivestreamCenterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data: [LiveCenterActivity] = [
    LiveCenterActivity(myIcon: "SubtractIcon1", myActivity: "Thống kê livestream"),
    LiveCenterActivity(myIcon: "SubtractIcon2", myActivity: "Danh sách chặn"),
    LiveCenterActivity(myIcon: "SubtractIcon3", myActivity: "Video phát lại"),
    ]
    
    let avtImage = UIImageView()
    let userName = UILabel()
    let idStackView = UIStackView()
    let userId = UILabel()
    let copyButton = UIButton()
    @IBOutlet weak var livestreamCenterActivity: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title  = "Trung tâm phát trực tiếp"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        livestreamCenterActivity.dataSource = self
        livestreamCenterActivity.delegate = self
        livestreamCenterActivity.register(UINib(nibName: "LiveStreamCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "LiveStreamCenterTableViewCell")
        
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
        
        let constraint = [
            avtImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            avtImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            userName.topAnchor.constraint(equalTo: avtImage.bottomAnchor,constant: 8),
            
            idStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            idStackView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 6),
            
            copyButton.widthAnchor.constraint(equalToConstant: 45),
            copyButton.heightAnchor.constraint(equalToConstant: 19)
            
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activity = data[indexPath.row]
        let cell = livestreamCenterActivity.dequeueReusableCell(withIdentifier: "LiveStreamCenterTableViewCell") as! LiveStreamCenterTableViewCell
        cell.loadActivity(acitivity: activity)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoRecordVC = VideoRecordViewController()
        livestreamCenterActivity.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 2 {
            self.navigationController?.pushViewController(videoRecordVC, animated: true)
        }
    }
}
struct LiveCenterActivity {
    var myIcon: String
    var myActivity: String
}
