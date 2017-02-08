//
//  ViewController.swift
//  Control Fun
//
//  Created by Josh T. Barrett on 2/8/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var leftSwitch: UISwitch!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"
    }
    
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }

    @IBAction func toggleControls(_ sender: UISegmentedControl) {
    }
    
}

