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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadActivity(acitivity: Activity) {
        activityIcon.image = UIImage(named: acitivity.imageName)
        activityName.text = acitivity.activityName
        activityName.font = UIFont(name: "Sarabun-Regular", size: 14)
        activityName.textColor = UIColor(named: "ActivityNameColor")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
