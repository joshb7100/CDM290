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
    private var prevval: Int = 0
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
            restaurantBill.names.append("")
        }
        for i in 0...200{
            splitPercents.append(Double(i)/2)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == peoplePicker{
            if(row != prevval){
                prevval = row
                splitTableView.reloadData()
            }
        }
    }

    
    
    @IBAction func billOutput(_ sender: UIButton) {
        performSegue(withIdentifier: "RestOutput", sender: nil)
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
        let cell = splitTableView.dequeueReusableCell(withIdentifier: splitCellTableIdentifier, for: indexPath) as! SplitTableViewCell
        cell.nameTextField.addTarget(self, action: #selector(doneEditing(_:)), for: .editingDidEndOnExit)
        cell.splitPicker.tag = (indexPath as NSIndexPath).row
        cell.nameTextField.tag = (indexPath as NSIndexPath).row
        cell.splitPercents = self.splitPercents
        //cell.splitPicker.addTarget(self, action: #selector(AddWizard.sliderChange(_:)), for: .)
        cell.splitPicker.selectRow(0, inComponent: 0, animated: false)
        cell.nameTextField.text = ""
        cell.splitPicker.reloadAllComponents()
        return cell
    }
    
    func doneEditing(_ sender: UITextField) {
        restaurantBill.names[sender.tag] = sender.text!
        sender.resignFirstResponder()
    }
    
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as! SliderTableViewCell
        
        cell.cellSlider.tag = (indexPath as NSIndexPath).row
        cell.cellSlider.addTarget(self, action: #selector(AddWizard.sliderChange(_:)), for: .valueChanged)
        cell.cellSlider.addTarget(self, action: #selector(AddWizard.sliderDoneChange(_:)), for: .touchUpInside )
        cell.cellSlider.addTarget(self, action: #selector(AddWizard.sliderDoneChange(_:)), for: .touchCancel )
        cell.cellSlider.value = Float(OilList[(indexPath as NSIndexPath).row].oilNum)
        cell.cellTextLabel.text = OilList[(indexPath as NSIndexPath).row].Name
        cell.cellNumber.text = String(Int(OilList[(indexPath as NSIndexPath).row].oilNum))
        cell.cellDetailTextLabel?.text = String(OilList[(indexPath as NSIndexPath).row].oilId)
        cell.cellSlider.minimumValue = 1
        cell.cellSlider.maximumValue = 100
        
        return cell
    }
 
    
    func sliderDoneChange(_ sender: UISlider) {
        var xTotal = 0.0
        for i in 0...OilList.count - 1 {
            xTotal = xTotal + OilList[i].oilNum
        }
        self.totalOil.text = String(Int(xTotal))
        
        
    }
    
    
    func sliderChange(_ sender: UISlider) {
        
        if OilList.count > 0 {
            let currentValue = sender.value
            let cell = self.OilTableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! SliderTableViewCell!
            cell?.cellNumber.text = String(Int(currentValue))
            OilList[sender.tag].oilNum = Double(Int(currentValue))
            
        }
        
    }
    */
    
    
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
        for tag in 0...(restaurantBill.numsplit - 1){
            let indexpath = IndexPath.init(row: tag, section: 0)
            let cell =  splitTableView.cellForRow(at: indexpath) as! SplitTableViewCell
            restaurantBill.percent.insert(splitPercents[cell.splitPicker.selectedRow(inComponent: 0)]/100, at: tag)
            restaurantBill.names.insert(cell.nameTextField.text!, at: tag)
        }
   
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
