//
//  TipViewController.swift
//  BillSplitter
//
//  Created by Robert Barrett on 3/12/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
	private var tipValues:[Int] = []
    private var tipBill: tipBill = tipBill()
    @IBOutlet weak var pretaxField: UITextField!
    @IBOutlet weak var posttaxField: UITextField!
    @IBOutlet weak var tipPicker: UIPickerView!
	@IBOutlet weak var tipOutput: UILabel!
	@IBOutlet weak var totalOutput: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        splitTableView.isHidden = true
        for i in 0...100{
            tipValues.append(i)
        }
        tipPicker.selectRow(20, inComponent: 0, animated: false)
		tipOutput.text = ""
		totalOutput.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }

    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        pretaxField.resignFirstResponder()
        posttaxField.resignFirstResponder()
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(tipValues[row]) + "%"
    }
    
    @IBAction func billOutput(_ sender: UIButton) {
        let tipPickerRow = tipPicker.selectedRow(inComponent: 0)
		tipBill.tip = Double(tipValues[tipPickerRow])/100
		tipBill.pretax = Double(pretaxField.text!)!
        tipBill.posttax = Double(posttaxField.text!)!
		tipBill.tipCalc()
		tipOutput.text = "Tip Amount: $\(ze(tipBill.tipamt))"
		totalOutput.text = "Total: $\(ze(tipBill.ftotal))"
    }

}
