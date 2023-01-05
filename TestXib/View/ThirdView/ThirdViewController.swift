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
    @IBOutlet weak var diamondTabView: UIView!
    @IBOutlet weak var rubyTabView: UIView!
    @IBOutlet weak var roseTabView: UIView!
    @IBOutlet weak var diamondTopup: UICollectionView!
    @IBOutlet weak var spacing1: UIView!
    @IBOutlet weak var spacing2: UIView!
    
    let diamondButton = UIButton()
    let rubyButton = UIButton()
    let roseButton = UIButton()
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
        diamondTopup.allowsMultipleSelection = false
        
        title  = "18 live +"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun-SemiBold", size: 18)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        //Custom tabView
        rect1.image = UIImage(named: "FooterRectangle")
        rect2.image = UIImage(named: "FooterRectangle")
        rect3.image = UIImage(named: "FooterRectangle")
        
        diamondTabView.addSubview(diamondButton)
        diamondButton.translatesAutoresizingMaskIntoConstraints = false
        diamondButton.setTitle("Kim cương", for: .normal)
        diamondButton.setTitleColor(.red, for: .normal)
        diamondButton.titleLabel?.font = UIFont(name: "Sarabun-SemiBold", size: 14)
        diamondButton.addTarget(self, action: #selector(diamondTopupp), for: .touchUpInside)
        diamondButton.addSubview(rect1)
        rect1.translatesAutoresizingMaskIntoConstraints = false
        
        rubyTabView.addSubview(rubyButton)
        rubyButton.translatesAutoresizingMaskIntoConstraints = false
        rubyButton.setTitle("Ruby", for: .normal)
        rubyButton.setTitleColor(.black, for: .normal)
        rubyButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        rubyButton.addTarget(self, action: #selector(rubyTopup), for: .touchUpInside)
        rubyButton.addSubview(rect2)
        rect2.translatesAutoresizingMaskIntoConstraints = false
        
        roseTabView.addSubview(roseButton)
        roseButton.translatesAutoresizingMaskIntoConstraints = false
        roseButton.setTitle("Hoa Hồng", for: .normal)
        roseButton.setTitleColor(.black, for: .normal)
        roseButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        roseButton.addTarget(self, action: #selector(roseTopup), for: .touchUpInside)
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
            diamondButton.topAnchor.constraint(equalTo: diamondTabView.topAnchor, constant: 0),
            diamondButton.bottomAnchor.constraint(equalTo: diamondTabView.bottomAnchor, constant: 0),
            diamondButton.leadingAnchor.constraint(equalTo: diamondTabView.leadingAnchor, constant: 0),
            diamondButton.trailingAnchor.constraint(equalTo: diamondTabView.trailingAnchor, constant: 0),
            
            rubyButton.topAnchor.constraint(equalTo: rubyTabView.topAnchor, constant: 0),
            rubyButton.bottomAnchor.constraint(equalTo: rubyTabView.bottomAnchor, constant: 0),
            rubyButton.leadingAnchor.constraint(equalTo: rubyTabView.leadingAnchor, constant: 0),
            rubyButton.trailingAnchor.constraint(equalTo: rubyTabView.trailingAnchor, constant: 0),
            
            roseButton.topAnchor.constraint(equalTo: roseTabView.topAnchor, constant: 0),
            roseButton.bottomAnchor.constraint(equalTo: roseTabView.bottomAnchor, constant: 0),
            roseButton.leadingAnchor.constraint(equalTo: roseTabView.leadingAnchor, constant: 0),
            roseButton.trailingAnchor.constraint(equalTo: roseTabView.trailingAnchor, constant: 0),
            
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
            subcript.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            spacing1.widthAnchor.constraint(equalToConstant: 0.5),
            spacing2.widthAnchor.constraint(equalToConstant: 0.5)
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
    var lastIndexActive: IndexPath = [1 ,0]
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Create Gradient color
        if self.lastIndexActive != indexPath {
            let cell = diamondTopup.cellForItem(at: indexPath) as! DiamondCollectionViewCell
            let gradientBorder = UICollectionViewCell.gradientImage(bounds: cell.bounds, colors: [UIColor(named: "ColorGr1")!, UIColor(named: "ColorGr2")!, UIColor(named: "ColorGr3")!])
            let gradientColor = UIColor(patternImage: gradientBorder)
            cell.backgroundColor =  UIColor(named: "SelectedCell")
            cell.layer.borderColor = gradientColor.cgColor
            cell.layer.borderWidth = 1.5
            cell.layer.masksToBounds = true
            
            let celll = diamondTopup.cellForItem(at: self.lastIndexActive) as? DiamondCollectionViewCell
            celll?.backgroundColor = UIColor(named: "CellColor")
            celll?.layer.borderColor = UIColor.systemBackground.cgColor
            celll?.layer.masksToBounds = true
            self.lastIndexActive = indexPath
        }
    }
        
    @objc func diamondTopupp() {
        diamondView.isHidden = false
        rubyView.isHidden = true
        roseView.isHidden = true
        rect1.isHidden = false
        rect2.isHidden = true
        rect3.isHidden = true
        diamondButton.titleLabel?.font = UIFont(name: "Sarabun-SemiBold", size: 14)
        diamondButton.setTitleColor(.red, for: .normal)
        rubyButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        rubyButton.setTitleColor(.black, for: .normal)
        roseButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        roseButton.setTitleColor(.black, for: .normal)
    }
    @objc func rubyTopup() {
        diamondView.isHidden = true
        rubyView.isHidden = false
        roseView.isHidden = true
        rect1.isHidden = true
        rect2.isHidden = false
        rect3.isHidden = true
        rubyButton.titleLabel?.font = UIFont(name: "Sarabun-SemiBold", size: 14)
        rubyButton.setTitleColor(.red, for: .normal)
        diamondButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        diamondButton.setTitleColor(.black, for: .normal)
        roseButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        roseButton.setTitleColor(.black, for: .normal)
    }
    @objc func roseTopup() {
        diamondView.isHidden = true
        rubyView.isHidden = true
        roseView.isHidden = false
        rect1.isHidden = true
        rect2.isHidden = true
        rect3.isHidden = false
        roseButton.titleLabel?.font = UIFont(name: "Sarabun-SemiBold", size: 14)
        roseButton.setTitleColor(.red, for: .normal)
        rubyButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        rubyButton.setTitleColor(.black, for: .normal)
        diamondButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        diamondButton.setTitleColor(.black, for: .normal)
    }
}

struct Diamond {
    var diamondNumber: String
    var diamondPrice: String
    var forSale: Bool
}

extension UICollectionViewCell {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)

//        // This makes it left to right, default is top to bottom
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradientLayer.type = .axial
        gradientLayer.locations = [0, 0.5, 1]

        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
