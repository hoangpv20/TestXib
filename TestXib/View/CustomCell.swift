//
//  CustomCell.swift
//  TestXib
//
//  Created by admin on 26/12/2022.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var rankImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var heartNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(item: Member) {
        rankImage.image = UIImage(named: item.memberRank)
        memberName.text = item.name
        memberName.font = UIFont(name: "Sarabun-Regular", size: 14)
        heartNumber.text = item.numberOfHeart
    }
    
    func colorCell(number: IndexPath) {
        if (number.row % 2 == 0) {
            backgroundColor = UIColor(named: "CellColor")
        }
    }
    
    func insertNumber(number: IndexPath) {
        if (number.row > 2) {
            let new = textToImage(drawText: "\(number.row + 1)", inImage: rankImage.image!, atPoint: CGPoint(x: 12, y: 6))
            rankImage.image = new
        }
    }
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Sarabun-Regular", size: 14)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
