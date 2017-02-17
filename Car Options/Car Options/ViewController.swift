//
//  ViewController.swift
//  Car Options
//
//  Created by Robert Barrett on 2/15/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var hoodImage: UIImageView!
    @IBOutlet weak var wingsImage: UIImageView!
    @IBOutlet weak var tiresImage: UIImageView!

    @IBAction func colorChanged(_ sender: UISlider) {
        switch(round(sender.value)){
        case 1: carImage.image = UIImage(named: "carr")
        case 2: carImage.image = UIImage(named: "carb")
        case 3: carImage.image = UIImage(named: "carw")
        case 4: carImage.image = UIImage(named: "carg")
        case 5: carImage.image = UIImage(named: "carblk")
        default: carImage.image = UIImage(named: "carw")
        }
    }
    @IBAction func wheelChanged(_ sender: UISlider) {
        switch(round(sender.value)){
        case 1: tiresImage.image = UIImage(named:"tiret")
        case 2: tiresImage.image = UIImage(named:"tiren")
        case 3: tiresImage.image = UIImage(named:"tireb")
        default: tiresImage.image = UIImage(named:"tiren")
        }
    }
    @IBAction func eaglePress(_ sender: UIButton) {
        hoodImage.isHidden = false
        hoodImage.image = UIImage(named:"eagle")
    }
    @IBAction func lionPress(_ sender: UIButton) {
        hoodImage.isHidden = false
        hoodImage.image = UIImage(named:"lion.png")
    }
    @IBAction func tigerPress(_ sender: UIButton) {
        hoodImage.isHidden = false
        hoodImage.image = UIImage(named:"tiger.png")
    }
    @IBAction func rocketSwitch(_ sender: UISwitch) {
        if sender.isOn{
            rocketImage.isHidden = false
        }
        else{
            rocketImage.isHidden = true
        }
    }
    @IBAction func wingSwitch(_ sender: UISwitch) {
        if sender.isOn{
            wingsImage.isHidden = false
        }
        else{
            wingsImage.isHidden = true
        }
    }

}

