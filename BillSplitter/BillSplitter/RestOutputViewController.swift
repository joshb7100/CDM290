//
//  RestOutputViewController.swift
//  BillSplitter
//
//  Created by Robert Barrett on 3/12/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class RestOutputViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var evenSplitLabel: UILabel!
    var restaurantBill: restBill = restBill()
    @IBOutlet weak var splitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = "$"+String(ze(number: restaurantBill.ftotal))
        tipLabel.text = "$"+String(ze(number: restaurantBill.tipamt))
        if(restaurantBill.even){
            evenSplitLabel.text = "Everyone pays $\(ze(number: restaurantBill.finsplit[0]))"
            splitTableView.isHidden = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
