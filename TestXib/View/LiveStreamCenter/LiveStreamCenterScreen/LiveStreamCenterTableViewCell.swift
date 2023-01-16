//
//  LiveStreamCenterTableViewCell.swift
//  TestXib
//
//  Created by admin on 16/01/2023.
//

import UIKit

class LiveStreamCenterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityIcon: UIImageView!
    @IBOutlet weak var activityName: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadActivity(acitivity: LiveCenterActivity) {
        activityIcon.image = UIImage(named: acitivity.myIcon)
        activityName.text = acitivity.myActivity
        activityName.font = UIFont(name: "Sarabun-Regular", size: 14)
        activityName.textColor = UIColor(named: "ActivityNameColor")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
