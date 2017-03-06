//
//  TipViewController.swift
//  TabPickerCriticalThinking
//
//  Created by Josh T. Barrett on 3/6/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var dollarTextField: UITextField!

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var tipOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        dollarTextField.resignFirstResponder()
    }

}
