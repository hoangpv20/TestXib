//
//  MyRecordTableViewCell.swift
//  TestXib
//
//  Created by admin on 16/01/2023.
//

import UIKit

class MyRecordTableViewCell: UITableViewCell {

    @IBOutlet weak var recordSubcript: UILabel!
    @IBOutlet weak var recordTime: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    let deleteButton = UIButton()
    let uploadButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonStackView.addArrangedSubview(deleteButton)
        buttonStackView.addArrangedSubview(uploadButton)
        recordSubcript.font = UIFont(name: "Sarabun-Regular", size: 14)
        recordSubcript.textColor =  UIColor(named: "ActivityNameColor")
        recordTime.font = UIFont(name: "Sarabun-Regular", size: 12)
        recordTime.textColor = UIColor(named: "UnselectedTextColor")
        
        deleteButton.backgroundColor = UIColor(named: "CopyButtonBackgroud")
        deleteButton.setTitle("Xoá", for: .normal)
        deleteButton.setTitleColor(UIColor(named: "CopyButtonText"), for: .normal)
        deleteButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        deleteButton.layer.cornerRadius = 5.0
        
        uploadButton.backgroundColor = UIColor(named: "UploadBackground")
        uploadButton.setTitle("Đăng lên", for: .normal)
        uploadButton.setTitleColor(.white, for: .normal)
        uploadButton.titleLabel?.font = UIFont(name: "Sarabun-Regular", size: 14)
        uploadButton.layer.cornerRadius = 5.0
        
        deleteButton.addTarget(self, action: #selector(didTapDelete), for: .touchUpInside)
        
    }
    @objc func didTapDelete() {
        
    }
    func loadData1(item: Record) {
        recordSubcript.text = item.subcript
        recordTime.text = item.time
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
