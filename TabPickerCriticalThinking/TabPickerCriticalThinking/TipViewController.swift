//
//  TipViewController.swift
//  TabPickerCriticalThinking
//
//  Created by Josh T. Barrett on 3/6/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var dollarTextField: UITextField!

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var tipOutput: UILabel!
    
    private let values = Array(0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipOutput.text = " "
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(values[row])%"
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        if dollarTextField.text != ""{
            let billamt = Double(dollarTextField.text!)
            tipOutput.text = "$\(round((billamt! * (Double(values[picker.selectedRow(inComponent: 0)])/100 + 1))*100)/100)"
        }
    }

}
