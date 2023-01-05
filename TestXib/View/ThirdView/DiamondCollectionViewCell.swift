//
//  DiamondCollectionViewCell.swift
//  TestXib
//
//  Created by admin on 04/01/2023.
//

import UIKit

class DiamondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sale: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var numberOfDiamonds: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        price.font = UIFont(name: "Sarabun-Regular", size: 12)
        numberOfDiamonds.font = UIFont(name: "Sarabun-SemiBold", size: 20)
    }
    func loadData(item: Diamond) {
        price.text = item.diamondPrice
        numberOfDiamonds.text = item.diamondNumber
        sale.isHidden = item.forSale
    }
}

