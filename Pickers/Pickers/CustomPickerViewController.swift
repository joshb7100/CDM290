//
//  CustomPickerViewController.swift
//  Pickers
//
//  Created by Josh T. Barrett on 2/27/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    private var images:[UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        images = [UIImage(named:"seven")!, UIImage(named:"bar")!, UIImage(named:"crown")!, UIImage(named:"cherry")!, UIImage(named:"lemon")!, UIImage(named:"apple")!]
        winLabel.text = " "
        arc4random_stir()
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

    @IBAction func spin(_ sender: UIButton) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        for i in 0..<5{
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal{
                numInRow += 1
            }
            else{
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if numInRow >= 3{
                win = true
            }
        }
        winLabel.text = win ? "WINNER!":" "// Note the space between the quotes
    }
    
    //MARK:-
    //MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    //MARK:-
    //MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image:image)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
}
