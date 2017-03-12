//
//  NameAndColorCell.swift
//  Table Cells
//
//  Created by Robert Barrett on 3/12/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    var name: String = ""{
        didSet{
            if(name != oldValue){
                nameLabel.text = name
            }
        }
    }
    var color:String = ""{
        didSet{
            if(color != oldValue){
                colorLabel.text = color
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
