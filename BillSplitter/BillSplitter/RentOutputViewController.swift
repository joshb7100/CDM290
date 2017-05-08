//
//  RentOutputViewController.swift
//  BillSplitter
//
//  Created by Robert Barrett on 3/12/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class RentOutputViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var rentbill: rentBill = rentBill()
    
    @IBOutlet weak var evenSplitLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitTableView: UITableView!
    
    let splitCellTableIdentifier = "FinalRentCellTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        totalLabel.text = "$"+String(ze(number: rentbill.ftotal))
        if(rentbill.even){
            evenSplitLabel.text = "Everyone pays $\(ze(number: rentbill.finsplit[0]))"
            splitTableView.isHidden = true
        }
        else{
            evenSplitLabel.isHidden = true
            splitTableView.register(FinalRentTableViewCell.self, forCellReuseIdentifier: splitCellTableIdentifier)
            let xib = UINib(nibName: "FinalRentTableViewCell", bundle: nil)
            splitTableView.register(xib, forCellReuseIdentifier: splitCellTableIdentifier)
            splitTableView.rowHeight = 40
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rentbill.numsplit
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(rentbill.even == false){
            let cell = splitTableView.dequeueReusableCell(withIdentifier: splitCellTableIdentifier, for: indexPath) as! FinalRentTableViewCell
            cell.nameLabel.text = rentbill.names[indexPath.row]
            cell.priceLabel.text = "$"+String(ze(number: rentbill.finsplit[indexPath.row]))
            return cell
        }
        else{
            let cell:UITableViewCell = UITableViewCell.init()
            return cell
        }
        
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
