//
//  EditObjectCell.swift
//  TestXib
//
//  Created by admin on 17/01/2023.
//

import UIKit

class EditObjectCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        label1.text = "Chỉnh sửa đối tượng"
        label1.font = UIFont(name: "Sarabun-Regular", size: 14)
        label1.textColor = UIColor(named: "ActivityNameColor")
        
        label2.text = "Công khai"
        label2.font = UIFont(name: "Sarabun-Regular", size: 14)
        label2.textColor = UIColor(named: "PublicColor")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
