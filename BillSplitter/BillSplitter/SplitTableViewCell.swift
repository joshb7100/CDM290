//
//  SplitTableViewCell.swift
//  BillSplitter
//
//  Created by Josh T. Barrett on 4/3/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class SplitTableViewCell: UITableViewCell{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var splitPicker: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

class TextFieldClass: NSObject{
    var text: String = ""
}

class PickerClass: NSObject {
    var value: Int = 0
}
