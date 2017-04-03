//
//  RestaurantViewController.swift
//  BillSplitter
//
//  Created by Robert Barrett on 3/12/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    var ftotal: Double
    var numsplit: Int
    var percent: [Double]
    var finsplit: [Double]
    var even: Int
    var arrayNum: Int
	var pretax: Double
    var posttax: Double
    var tip: Double
    var paidby: String
    var names: [String]

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

}
