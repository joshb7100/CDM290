//
//  ViewController.swift
//  TicTacToeJoshB
//
//  Created by Josh T. Barrett on 2/1/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var TicTacToeOutput: UILabel!
    
    @IBAction func TicTacButton1Pressed(_ sender: UIButton) {
        sender.isEnabled = false
        let turn = TicTacToeOutput.text!
        if(turn == "Place an X"){
            sender.setTitle("X", for: UIControlState.normal)
            TicTacToeOutput.text = "Place an O"
        }
        if(turn == "Place an O"){
            sender.setTitle("O", for: UIControlState.normal)
            TicTacToeOutput.text = "Place an X"
        }
    }
    
    
    
}

