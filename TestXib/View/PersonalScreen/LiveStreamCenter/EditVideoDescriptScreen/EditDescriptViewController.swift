//
//  EditDescriptViewController.swift
//  TestXib
//
//  Created by admin on 17/01/2023.
//

import UIKit

class EditDescriptViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let videoAvt = UIImageView()
    let videoTitle = UILabel()
    let titleName = UILabel()
    let wordNumber = UILabel()
    let editObject = UITableView()
    let editPicture = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        title  = "Chỉnh sửa"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes

        let rightButton = UIBarButtonItem()
        rightButton.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Sarabun-Medium", size: 16)!
        ], for: .normal)
        rightButton.title = "Lưu"
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor(patternImage: UIImage(named: "SaveColor")!)
        
        view.addSubview(videoAvt)
        videoAvt.translatesAutoresizingMaskIntoConstraints = false
        videoAvt.image = UIImage(named: "ProfilePicture")
        videoAvt.addSubview(editPicture)
        editPicture.translatesAutoresizingMaskIntoConstraints = false
        editPicture.setBackgroundImage(UIImage(named: "EditPictureButton"), for: .normal)
        editPicture.addTarget(self, action: #selector(editAvtVideo), for: .touchUpInside)
        
        view.addSubview(videoTitle)
        videoTitle.translatesAutoresizingMaskIntoConstraints = false
        videoTitle.text = "Tiêu đề video"
        videoTitle.font = UIFont(name: "Sarabun-SemiBold", size: 14)
        
        view.addSubview(titleName)
        titleName.translatesAutoresizingMaskIntoConstraints = false
        titleName.backgroundColor = .white
        titleName.font = UIFont(name: "sarabun-Regular", size: 14)
        titleName.layer.cornerRadius = 8.0
        titleName.numberOfLines = 4
        titleName.textAlignment = .left
        titleName.text = "Toi la Tu la mot nguoi dep trai !!!!"
        titleName.textColor = UIColor(named: "ActivityNameColor")
        
        view.addSubview(wordNumber)
        wordNumber.translatesAutoresizingMaskIntoConstraints = false
        wordNumber.font = UIFont(name: "Sarabun-Regular", size: 14)
        wordNumber.textColor = UIColor(named: "UnselectedTextColor")
        wordNumber.text = "\(titleName.text?.count ?? 0)/200"
        
        view.addSubview(editObject)
        editObject.translatesAutoresizingMaskIntoConstraints = false
        editObject.delegate = self
        editObject.dataSource = self
        editObject.register(UINib(nibName: "EditObjectCell", bundle: nil), forCellReuseIdentifier: "EditObjectCell")
        editObject.layer.cornerRadius = 8.0
        
        let constraint = [
            videoAvt.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            videoAvt.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            
            editPicture.trailingAnchor.constraint(equalTo: videoAvt.trailingAnchor, constant: -12),
            editPicture.bottomAnchor.constraint(equalTo: videoAvt.bottomAnchor, constant: -12.42),
            
            videoTitle.topAnchor.constraint(equalTo: videoAvt.bottomAnchor, constant: 22.58),
            videoTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            titleName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleName.topAnchor.constraint(equalTo: videoTitle.bottomAnchor, constant: 12),
            titleName.heightAnchor.constraint(equalToConstant: 92),
            
            wordNumber.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 4),
            wordNumber.trailingAnchor.constraint(equalTo: titleName.trailingAnchor, constant: 0),
            
            editObject.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            editObject.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            editObject.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 34),
            editObject.heightAnchor.constraint(equalToConstant: 48)
            
        ]
        NSLayoutConstraint.activate(constraint)
    }
    @objc func saveAction() {
    }
    @objc func editAvtVideo() {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = editObject.dequeueReusableCell(withIdentifier: "EditObjectCell") as! EditObjectCell
        cell.layer.cornerRadius = 5.0
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editObjcVC = EditObjectViewController()
        editObject.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(editObjcVC, animated: true)
    }
}
