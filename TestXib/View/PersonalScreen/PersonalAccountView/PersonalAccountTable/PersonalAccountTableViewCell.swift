//
//  PersonalAccountTableViewCell.swift
//  TestXib
//
//  Created by admin on 31/01/2023.
//

import UIKit

class PersonalAccountTableViewCell: UITableViewCell {
    @IBOutlet weak var activityIcon: UIImageView!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var cellCircle: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func loadActivity(acitivity: Activity) {
        activityIcon.image = UIImage(named: acitivity.imageName)
        activityName.text = acitivity.activityName
        cellCircle.isHidden = acitivity.hiddenCircle
        activityName.font = UIFont(name: "Sarabun-Regular", size: 14)
        activityName.textColor = UIColor(named: "ActivityNameColor")
    }
    
    func insertNumber(number: IndexPath) {
        if (number.row == 0) {
            let new = textToImage(drawText: "99+", inImage: cellCircle.image!, atPoint: CGPoint(x: 2, y: 3))
            cellCircle.image = new
        }
        if (number.row == 1) {
            let new = textToImage(drawText: "N", inImage: cellCircle.image!, atPoint: CGPoint(x: 6, y: 3))
            cellCircle.image = new
        }
    }
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Sarabun-SemiBold", size: 10)!
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

    }
    
}
