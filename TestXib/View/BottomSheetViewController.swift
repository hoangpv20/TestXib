//
//  BottomSheetViewController.swift
//  TestXib
//
//  Created by admin on 26/12/2022.
//

import UIKit

class BottomSheetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data: [Member] = [
    Member(memberRank: "goldTrophy", name: "Cin Lunn", numberOfHeart: "10k"),
    Member(memberRank: "silverTrophy", name: "Cin Lunn", numberOfHeart: "4.5k"),
    Member(memberRank: "bronzeTrophy", name: "Cin Lunn", numberOfHeart: "1k"),
    Member(memberRank: "smallRank", name: "Cin Lunn", numberOfHeart: "505"),
    Member(memberRank: "smallRank", name: "Cin Lunn", numberOfHeart: "300"),
    Member(memberRank: "smallRank", name: "Cin Lunn", numberOfHeart: "300"),
    ]
    
    let cellSpacingHeight: CGFloat = 20
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        
        myTable.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        let myView = UIView()
// Custom UISegment
        
        let mySegmentedControl = UISegmentedControl(items: ["Live", "BXH ngay", "BXH tuan", "BXH thang"])
//        let mySegmentedControl2 = UISegmentedControl(items: ["Nguoi xem 319", "BXH cong hien"])
        
        let xPostion: CGFloat = 20
        let yPostion: CGFloat = 67
        let elementWidth: CGFloat = 350
        let elementHeight: CGFloat = 30
        
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        mySegmentedControl.selectedSegmentIndex = 1
        mySegmentedControl.tintColor = .gray
        mySegmentedControl.selectedSegmentTintColor = UIColor(named: "SelectedColor")
        mySegmentedControl.backgroundColor = UIColor.white
        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(mySegmentedControl)
        
// Custom footerView
        self.view.addSubview(myView)
        self.myTable.bringSubviewToFront(myView)
        myView.backgroundColor = .white
        myView.translatesAutoresizingMaskIntoConstraints =  false
        let myRanking = UIImageView()
        myRanking.image = UIImage(named: "30+")
        let myAvt = UIImageView()
        myAvt.image = UIImage(named: "Avt")
        let myName = UILabel()
        myName.text = "Tu Hy My"
        myName.font = UIFont(name: "Sarabun-Regular", size: 14)
        let heart = UIImageView()
        heart.image = UIImage(named: "heart")
        let myHeart = UILabel()
        myHeart.text = "0"
        let upRankButton = UIButton()
        upRankButton.setTitle("Len BXH", for: .normal)
        upRankButton.setTitleColor(.black, for: .normal)
        upRankButton.layer.backgroundColor = UIColor.white.cgColor
        upRankButton.layer.cornerRadius = 10
        upRankButton.layer.borderWidth = 1
        upRankButton.layer.borderColor = UIColor.black.cgColor
        upRankButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        upRankButton.addTarget(self, action: #selector(upRankAction), for: .touchUpInside)
        
        myView.addSubview(myRanking)
        myView.addSubview(myAvt)
        myView.addSubview(myName)
        myView.addSubview(heart)
        myView.addSubview(myHeart)
        myView.addSubview(upRankButton)
        
        myRanking.translatesAutoresizingMaskIntoConstraints = false
        myAvt.translatesAutoresizingMaskIntoConstraints = false
        myName.translatesAutoresizingMaskIntoConstraints = false
        heart.translatesAutoresizingMaskIntoConstraints = false
        myHeart.translatesAutoresizingMaskIntoConstraints = false
        upRankButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
        myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        myView.heightAnchor.constraint(equalToConstant: 82),
        myView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
        
        myRanking.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 0),
        myRanking.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 12),
        
        myAvt.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 0),
        myAvt.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 41),
        myAvt.heightAnchor.constraint(equalToConstant: 42),
        myAvt.widthAnchor.constraint(equalToConstant: 42),
        
        myName.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: -13),
        myName.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 91),
        
        heart.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 13),
        heart.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 91),
        
        myHeart.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 13),
        myHeart.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 119),
        
        upRankButton.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 0),
        upRankButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -20),
        upRankButton.widthAnchor.constraint(equalToConstant: 116),
        upRankButton.heightAnchor.constraint(equalToConstant: 32)
        ]
        NSLayoutConstraint.activate(constraint)
        
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl!) {
        print("hhh")
    }
    @objc func upRankAction(sender: UIButton!) {
        print("UP RANK")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let member = data[indexPath.row]
        let cell = myTable.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.loadData(item: member)
        cell.insertNumber(number: indexPath)
        cell.colorCell(number: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: myTable.frame.size.width, height: 42))
        footerView.backgroundColor = UIColor.lightGray
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 42
    }
}

struct Member {
    var memberRank: String
    var name: String
    var numberOfHeart: String
}



