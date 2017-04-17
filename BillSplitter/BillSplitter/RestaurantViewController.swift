//
//  RestaurantViewController.swift
//  BillSplitter
//
//  Created by Robert Barrett on 3/12/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource {
    private var tipValues:[Int] = []
    private var peopleValues:[Int] = []
    private var restaurantBill: restBill = restBill()
    private var splitPercents:[Double] = []
    let splitCellTableIdentifier = "SplitCellTableIdentifier"
    @IBOutlet weak var pretaxField: UITextField!
    @IBOutlet weak var posttaxField: UITextField!
    @IBOutlet weak var tipPicker: UIPickerView!
    @IBOutlet weak var peoplePicker: UIPickerView!
    @IBOutlet weak var splitSwitch: UISegmentedControl!
    @IBOutlet weak var splitTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //restaurantBill = restBill()
        splitTableView.isHidden = true
        for i in 0...100{
            tipValues.append(i)
        }
        for i in 1...30{
            peopleValues.append(i)
        }
        for i in 0...1000{
            splitPercents.append(Double(i)/10)
        }
        tipPicker.selectRow(20, inComponent: 0, animated: false)
        splitTableView.register(SplitTableViewCell.self, forCellReuseIdentifier: splitCellTableIdentifier)
        let xib = UINib(nibName: "SplitTableViewCell", bundle: nil)
        splitTableView.register(xib, forCellReuseIdentifier: splitCellTableIdentifier)
        splitTableView.rowHeight = 100
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
        if(pickerView == tipPicker){
            return tipValues.count
        }
        else{
            return peopleValues.count
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == tipPicker){
            return String(tipValues[row]) + "%"
        }
        else{
            return String(peopleValues[row])
        }
    }
    
    @IBAction func billOutput(_ sender: UIButton) {
        performSegue(withIdentifier: "RestOutput", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //Int(peoplePicker.selectedRow(inComponent: 0))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = splitTableView.dequeueReusableCell(withIdentifier: splitCellTableIdentifier, for: indexPath) as! SplitTableViewCell
        cell.splitPicker.selectRow(0, inComponent: 0, animated: false)
        cell.nameTextField.text = ""
        return cell
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tipPickerRow = tipPicker.selectedRow(inComponent: 0)
        restaurantBill.tip = Double(tipValues[tipPickerRow])/100
        let peoplePickerRow = peoplePicker.selectedRow(inComponent: 0)
        restaurantBill.numsplit = peopleValues[peoplePickerRow]
        restaurantBill.pretax = Double(pretaxField.text!)!
        restaurantBill.posttax = Double(posttaxField.text!)!
        if(splitSwitch.selectedSegmentIndex == 0){
            restaurantBill.even = true
        }
        else{
            restaurantBill.even = false
        }
        restaurantBill.restaurantSplit()
        
        let outputVC = segue.destination as! RestOutputViewController
        outputVC.restaurantBill = restaurantBill
    }

}
