//
//  MyUploadTableViewCell.swift
//  TestXib
//
//  Created by admin on 16/01/2023.
//

import UIKit

class MyUploadTableViewCell: UITableViewCell {

    @IBOutlet weak var uploadSubcript: UILabel!
    @IBOutlet weak var uploadTime: UILabel!
    @IBOutlet weak var uploadStackView: UIStackView!
    let deleteButton = UIButton()
    let editButton = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        uploadStackView.addArrangedSubview(deleteButton)
        uploadStackView.addArrangedSubview(editButton)
        uploadSubcript.font = UIFont(name: "Sarabun-Regular", size: 14)
        uploadSubcript.textColor =  UIColor(named: "ActivityNameColor")
        uploadTime.font = UIFont(name: "Sarabun-Regular", size: 12)
        uploadTime.textColor = UIColor(named: "UnselectedTextColor")
        
        deleteButton.backgroundColor = UIColor(named: "CopyButtonBackgroud")
        deleteButton.setTitle("Xoá", for: .normal)
        deleteButton.setTitleColor(UIColor(named: "CopyButtonText"), for: .normal)
        deleteButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        deleteButton.layer.cornerRadius = 5.0
        
        editButton.backgroundColor = UIColor(named: "EditBackground")
        editButton.setTitle("Chỉnh sủa", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        editButton.layer.cornerRadius = 5.0
    }
    
    func loadData(item: Upload) {
        uploadSubcript.text = item.subcript
        uploadTime.text = item.time
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
