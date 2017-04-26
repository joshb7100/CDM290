//
//  SplitTableViewCell.swift
//  BillSplitter
//
//  Created by Josh T. Barrett on 4/3/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class SplitTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var splitPicker: UIPickerView!
    
     var splitPercents:[Double] = []
    
    override func awakeFromNib() {
        self.splitPicker.delegate = self
        self.splitPicker.dataSource = self
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return splitPercents.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String("\(splitPercents[row])%")
    }
}





class TextFieldClass: NSObject{
    var text: String = ""
}

class PickerClass: NSObject {
    var value: Int = 0
}
