//
//  EditObjectViewController.swift
//  TestXib
//
//  Created by admin on 17/01/2023.
//

import UIKit

class EditObjectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let dataArray = ["English", "Chinese", "Poland", "Japanese", "Vienamese"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let UIPicker: UIPickerView = UIPickerView()
        UIPicker.delegate = self
        UIPicker.dataSource = self
        self.view.addSubview(UIPicker)
        UIPicker.center = self.view.center
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        return row
    }

}
