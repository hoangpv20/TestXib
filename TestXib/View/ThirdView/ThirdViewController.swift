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
    @IBOutlet weak var diamondTopup: UICollectionView!
    
    let myDiamond = UIImageView()
    let bigIcon = UIImageView()
    let abstract = UIButton()
    let diamondTotal = UILabel()
    let diamondCurrent = UILabel()
    let subcript = UILabel()
    
    let customTabView = TabbarGradient()
    
    let data: [Diamond] = [
        Diamond(diamondNumber: "69", diamondPrice: "100.000 vnd", forSale: false),
        Diamond(diamondNumber: "139", diamondPrice: "100.000 vnd", forSale: true),
        Diamond(diamondNumber: "349", diamondPrice: "100.000 vnd", forSale: false),
        Diamond(diamondNumber: "699", diamondPrice: "100.000 vnd", forSale: true),
        Diamond(diamondNumber: "2499", diamondPrice: "100.000 vnd", forSale: true),
        Diamond(diamondNumber: "6999", diamondPrice: "100.000 vnd", forSale: true),
    ]
    
    var lastIndexActive: IndexPath = [1 ,0]
    
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
        
        view.addSubview(customTabView)
        customTabView.translatesAutoresizingMaskIntoConstraints = false
        customTabView.diamondTabView.myButton.addTarget(self, action: #selector(diamondTopupp), for: .touchUpInside)
        customTabView.rubyTabView.myButton.addTarget(self, action: #selector(rubyTopup), for: .touchUpInside)
        customTabView.roseTabView.myButton.addTarget(self, action: #selector(roseTopup), for: .touchUpInside)
        customTabView.diamondTabView.myButton.setTitleColor(.red, for: .normal)
        customTabView.diamondTabView.myButton.titleLabel?.font = UIFont(name: "Sarabun-SemiBold", size: 14)
        
        rubyView.isHidden = true
        roseView.isHidden = true
        customTabView.roseTabView.footRect.isHidden = true
        customTabView.rubyTabView.footRect.isHidden = true
        
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
            
            customTabView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTabView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            customTabView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            customTabView.heightAnchor.constraint(equalToConstant: 25),
            
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
            
            subcript.topAnchor.constraint(equalTo: myDiamond.bottomAnchor, constant: 13),
            subcript.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
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
        customTabView.diamondTabView.selectedItem()
        customTabView.rubyTabView.unselectedItem()
        customTabView.roseTabView.unselectedItem()
    }
    @objc func rubyTopup() {
        diamondView.isHidden = true
        rubyView.isHidden = false
        roseView.isHidden = true
        customTabView.diamondTabView.unselectedItem()
        customTabView.rubyTabView.selectedItem()
        customTabView.roseTabView.unselectedItem()
    }
    @objc func roseTopup() {
        diamondView.isHidden = true
        rubyView.isHidden = true
        roseView.isHidden = false
        customTabView.diamondTabView.unselectedItem()
        customTabView.rubyTabView.unselectedItem()
        customTabView.roseTabView.selectedItem()
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

        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
