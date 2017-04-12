//
//  SplitTableViewCell.swift
//  BillSplitter
//
//  Created by Josh T. Barrett on 4/3/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class SplitTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var splitPicker: UIPickerView!
    private var splitPercents:[Double] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for i in 0...1000{
            splitPercents.append(Double(i)/10)
        }
        splitPicker.selectRow(0, inComponent: 0, animated: false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func textFieldDoneEditing(_ sender: UITextField) {
        nameTextField.resignFirstResponder()
    }
    
    
    @IBAction func onTapRecognized(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return splitPercents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(splitPercents[row])+"%"
        
    }

}
