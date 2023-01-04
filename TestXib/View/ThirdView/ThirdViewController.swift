//
//  ThirdViewController.swift
//  TestXib
//
//  Created by admin on 29/12/2022.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var diamondView: UIView!
    @IBOutlet weak var rubyView: UIView!
    @IBOutlet weak var roseView: UIView!
    @IBOutlet weak var diamondButton: UIButton!
    @IBOutlet weak var rubyButton: UIButton!
    @IBOutlet weak var roseButton: UIButton!
    @IBOutlet weak var diamondTopup: UICollectionView!
    
    let myDiamond = UIImageView()
    let bigIcon = UIImageView()
    let abstract = UIButton()
    let diamondTotal = UILabel()
    let diamondCurrent = UILabel()
    let rect1 = UIImageView()
    let rect2 = UIImageView()
    let rect3 = UIImageView()
    let subcript = UILabel()
    
    let data: [Diamond] = [
        Diamond(diamondNumber: "69", diamondPrice: "100.000 vnd", forSale: false),
        Diamond(diamondNumber: "139", diamondPrice: "100.000 vnd", forSale: true),
        Diamond(diamondNumber: "349", diamondPrice: "100.000 vnd", forSale: false),
        Diamond(diamondNumber: "699", diamondPrice: "100.000 vnd", forSale: true),
        Diamond(diamondNumber: "2499", diamondPrice: "100.000 vnd", forSale: true),
        Diamond(diamondNumber: "6999", diamondPrice: "100.000 vnd", forSale: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diamondTopup.dataSource = self
        diamondTopup.delegate = self
        diamondTopup.register(UINib(nibName: "DiamondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiamondCollectionViewCell")
        
        title  = "18 live +"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        //Custom tabView
        rect1.image = UIImage(named: "FooterRectangle")
        rect2.image = UIImage(named: "FooterRectangle")
        rect3.image = UIImage(named: "FooterRectangle")
        diamondButton.addSubview(rect1)
        rect1.translatesAutoresizingMaskIntoConstraints = false
        rubyButton.addSubview(rect2)
        rect2.translatesAutoresizingMaskIntoConstraints = false
        roseButton.addSubview(rect3)
        rect3.translatesAutoresizingMaskIntoConstraints = false
        rubyView.isHidden = true
        roseView.isHidden = true
        rect2.isHidden = true
        rect3.isHidden = true
        
        //Custom MyDiamond frame
        diamondView.addSubview(myDiamond)
        myDiamond.addSubview(bigIcon)
        myDiamond.addSubview(diamondTotal)
        myDiamond.addSubview(diamondCurrent)
        myDiamond.addSubview(abstract)
        myDiamond.translatesAutoresizingMaskIntoConstraints = false
        myDiamond.image = UIImage(named: "MyDiamondFrame")
        bigIcon.translatesAutoresizingMaskIntoConstraints = false
        bigIcon.image = UIImage(named: "myDiamond")
        diamondTotal.translatesAutoresizingMaskIntoConstraints = false
        diamondTotal.text = "699"
        diamondTotal.font = UIFont(name: "Sarabun-SemiBold", size: 24)
        diamondTotal.textColor = .white
        diamondCurrent.translatesAutoresizingMaskIntoConstraints = false
        diamondCurrent.text = "Kim cương hiện tại"
        diamondCurrent.font = UIFont(name: "Sarabun-Regular", size: 14)
        diamondCurrent.textColor = .white
        abstract.translatesAutoresizingMaskIntoConstraints = false
        abstract.setImage(UIImage(named: "Abstract"), for: .normal)
        
        myDiamond.addSubview(subcript)
        subcript.translatesAutoresizingMaskIntoConstraints = false
        subcript.text = "Nạp kim cương"
        subcript.font = UIFont(name: "Sarabun-Regular", size: 18)
        
        let constraint = [
            myDiamond.topAnchor.constraint(equalTo: diamondView.topAnchor, constant: 36),
            myDiamond.centerXAnchor.constraint(equalTo: diamondView.centerXAnchor, constant: 0),
            
            bigIcon.topAnchor.constraint(equalTo: myDiamond.topAnchor, constant: 21),
            bigIcon.leadingAnchor.constraint(equalTo: myDiamond.leadingAnchor, constant: 21),
            
            diamondTotal.topAnchor.constraint(equalTo: myDiamond.topAnchor, constant: 20),
            diamondTotal.leadingAnchor.constraint(equalTo: myDiamond.leadingAnchor, constant: 57),
            
            diamondCurrent.leadingAnchor.constraint(equalTo: myDiamond.leadingAnchor, constant: 24),
            diamondCurrent.bottomAnchor.constraint(equalTo: myDiamond.bottomAnchor, constant: -26),
            
            abstract.topAnchor.constraint(equalTo: myDiamond.topAnchor, constant: 25),
            abstract.trailingAnchor.constraint(equalTo: myDiamond.trailingAnchor, constant: -18),
            
            rect1.centerXAnchor.constraint(equalTo: diamondButton.centerXAnchor, constant: 0),
            rect1.bottomAnchor.constraint(equalTo: diamondButton.bottomAnchor, constant: 0),
            
            rect2.centerXAnchor.constraint(equalTo: rubyButton.centerXAnchor, constant: 0),
            rect2.bottomAnchor.constraint(equalTo: rubyButton.bottomAnchor, constant: 0),
            
            rect3.centerXAnchor.constraint(equalTo: roseButton.centerXAnchor, constant: 0),
            rect3.bottomAnchor.constraint(equalTo: roseButton.bottomAnchor, constant: 0),
            
            subcript.topAnchor.constraint(equalTo: myDiamond.bottomAnchor, constant: 13),
            subcript.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let diamond = data[indexPath.row]
        let cell = diamondTopup.dequeueReusableCell(withReuseIdentifier: "DiamondCollectionViewCell", for: indexPath) as! DiamondCollectionViewCell
        cell.loadData(item: diamond)
        cell.layer.cornerRadius = 12.0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width*107/375, height: 67)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = diamondTopup.cellForItem(at: indexPath)
        if cell?.backgroundColor == UIColor(named: "CellColor") {
            cell?.layer.borderWidth = 1.5
            cell?.backgroundColor = UIColor(named: "SelectedCell")
            cell?.layer.borderColor = UIColor(named: "SelectedBorder")?.cgColor
        } else {
            cell?.backgroundColor = UIColor(named: "CellColor")
            cell?.layer.borderColor = UIColor.systemBackground.cgColor
        }
    }
    
    
    @IBAction func diamondTopup(_ sender: Any) {
        diamondView.isHidden = false
        rubyView.isHidden = true
        roseView.isHidden = true
        rect1.isHidden = false
        rect2.isHidden = true
        rect3.isHidden = true
        diamondButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        rubyButton.titleLabel?.textColor = .black
        roseButton.titleLabel?.textColor = .black
    }
    @IBAction func rubyTopup(_ sender: Any) {
        diamondView.isHidden = true
        rubyView.isHidden = false
        roseView.isHidden = true
        rect1.isHidden = true
        rect2.isHidden = false
        rect3.isHidden = true
        diamondButton.titleLabel?.textColor = .black
        roseButton.titleLabel?.textColor = .black
        rubyButton.tintColor = .red
        rubyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    @IBAction func roseTopup(_ sender: Any) {
        diamondView.isHidden = true
        rubyView.isHidden = true
        roseView.isHidden = false
        rect1.isHidden = true
        rect2.isHidden = true
        rect3.isHidden = false
        diamondButton.titleLabel?.textColor = .black
        rubyButton.titleLabel?.textColor = .black
        roseButton.tintColor = .red
        roseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
}
struct Diamond {
    var diamondNumber: String
    var diamondPrice: String
    var forSale: Bool
}
