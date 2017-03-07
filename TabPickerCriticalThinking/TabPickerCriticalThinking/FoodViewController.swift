//
//  FoodViewController.swift
//  TabPickerCriticalThinking
//
//  Created by Josh T. Barrett on 3/6/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var totalOutput: UILabel!
    
    private let main = ["Sandwich","Soup","Salad","Burger"]
    private let mainPrices = [5.99,3.50,4.25,5.75]
    private let mainComponent = 0
    private let sides = ["Chips","Fries","None"]
    private let sidesPrices = [0.99,1.50,0]
    private let sidesComponent = 1
    private let drink = ["Soda","Shake","Water","None"]
    private let drinkPrices = [1.30,2.5,0,0]
    private let drinkComponent = 2
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalOutput.text = " "
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == mainComponent{
            return main.count
        }
        else if component == sidesComponent{
            return sides.count
        }
        else{
            return drink.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == mainComponent{
            return main[row]
        }
        else if component == sidesComponent{
            return sides[row]
        }
        else{
            return drink[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        if component == mainComponent{
            return pickerWidth*2/5
        }
        else if component == sidesComponent{
            return pickerWidth*3/10
        }
        else{
            return pickerWidth*3/10
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        totalOutput.text = "$\(mainPrices[picker.selectedRow(inComponent: mainComponent)]+sidesPrices[picker.selectedRow(inComponent: sidesComponent)]+drinkPrices[picker.selectedRow(inComponent: drinkComponent)])"
    }

}
