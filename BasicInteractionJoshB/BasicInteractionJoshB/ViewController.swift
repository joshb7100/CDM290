//
//  ViewController.swift
//  BasicInteractionJoshB
//
//  Created by Josh T. Barrett on 1/30/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.title(for: .selected)!
        let text = "\(title) button pressed."
        let styledText = NSMutableAttributedString(string:text)
        let attributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)]
        let nameRange = (text as NSString).range(of:title)
        styledText.setAttributes(attributes,range: nameRange)
        statusLabel.attributedText = styledText
    }
    
    

}

