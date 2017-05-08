//
//  RentViewController.swift
//  BillSplitter
//
//  Created by Robert Barrett on 3/12/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class RentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {
    private var peopleValues:[Int] = []
    private var rentbill: rentBill = rentBill()
    private var splitPercents:[Double] = []
    let splitCellTableIdentifier = "SplitCellTableIdentifier"
    
    @IBOutlet weak var rentTextField: UITextField!
    @IBOutlet weak var utilitiesTextField: UITextField!
    @IBOutlet weak var otherTextField: UITextField!
    @IBOutlet weak var peoplePicker: UIPickerView!
    @IBOutlet weak var splitSwitch: UISegmentedControl!
    @IBOutlet weak var splitTableView: UITableView!
    private var prevval: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 1...30{
            peopleValues.append(i)
        }
        for i in 0...200{
            splitPercents.append(Double(i)/2)
        }
        splitTableView.register(SplitTableViewCell.self, forCellReuseIdentifier: splitCellTableIdentifier)
        let xib = UINib(nibName: "SplitTableViewCell", bundle: nil)
        splitTableView.register(xib, forCellReuseIdentifier: splitCellTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func onTapRecognized(_ sender: UITapGestureRecognizer) {
        rentTextField.resignFirstResponder()
        utilitiesTextField.resignFirstResponder()
        otherTextField.resignFirstResponder()
    }
    
    @IBAction func toggleSplit(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            splitTableView.isHidden = true
        }
        else{
            splitTableView.isHidden = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return peopleValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(peopleValues[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == peoplePicker{
            if(row != prevval){
                prevval = row
                splitTableView.reloadData()
            }
        }
    }
    
    
    
    
}
