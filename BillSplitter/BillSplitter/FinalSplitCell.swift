//
//  FinalSplitCell.swift
//  BillSplitter
//
//  Created by Robert Barrett on 5/7/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class FinalSplitCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
