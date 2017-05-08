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
    let splitCellTableIdentifier = "RentSplitCellTableIdentifier"
    
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
            rentbill.names.append("")
        }
        for i in 0...200{
            splitPercents.append(Double(i)/2)
        }
        splitTableView.isHidden = true
        splitTableView.register(RentTableViewCell.self, forCellReuseIdentifier: splitCellTableIdentifier)
        let xib = UINib(nibName: "RentTableViewCell", bundle: nil)
        splitTableView.register(xib, forCellReuseIdentifier: splitCellTableIdentifier)
        splitTableView.rowHeight = 100
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
    @IBAction func billOutput(_ sender: UIButton) {
        performSegue(withIdentifier: "RentOutput", sender: nil)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let peoplePickerRow = peoplePicker.selectedRow(inComponent: 0)
        return peopleValues[peoplePickerRow]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = splitTableView.dequeueReusableCell(withIdentifier: splitCellTableIdentifier, for: indexPath) as! RentTableViewCell
        cell.nameTextField.addTarget(self, action: #selector(doneEditing(_:)), for: .editingDidEndOnExit)
        cell.splitPicker.tag = (indexPath as NSIndexPath).row
        cell.nameTextField.tag = (indexPath as NSIndexPath).row
        cell.splitPercents = self.splitPercents
        cell.splitPicker.selectRow(0, inComponent: 0, animated: false)
        cell.nameTextField.text = ""
        cell.splitPicker.reloadAllComponents()
        return cell
    }
    
    func doneEditing(_ sender: UITextField) {
        rentbill.names[sender.tag] = sender.text!
        sender.resignFirstResponder()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rentbill.rent = Double(rentTextField.text!)!
        rentbill.utilities = Double(utilitiesTextField.text!)!
        rentbill.othertot = Double(otherTextField.text!)!
        let peoplePickerRow = peoplePicker.selectedRow(inComponent: 0)
        rentbill.numsplit = peopleValues[peoplePickerRow]
        
        if(splitSwitch.selectedSegmentIndex == 0){
            rentbill.even = true
        }
        else{
            rentbill.even = false
            for tag in 0...(rentbill.numsplit - 1){
                let indexpath = IndexPath.init(row: tag, section: 0)
                let cell =  splitTableView.cellForRow(at: indexpath) as! RentTableViewCell
                rentbill.percent.insert(splitPercents[cell.splitPicker.selectedRow(inComponent: 0)]/100, at: tag)
                rentbill.names.insert(cell.nameTextField.text!, at: tag)
            }
        }
        rentbill.rentSplit()
        
        let outputVC = segue.destination as! RentOutputViewController
        outputVC.rentbill = rentbill
    }

    
    
    
}
