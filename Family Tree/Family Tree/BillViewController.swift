//
//  ViewController.swift
//  Family Tree
//
//  Created by Josh T. Barrett on 2/20/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class BillViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var billKids = ["Michael*", "Jason*"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return billKids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = billKids[indexPath.row]
        return cell
    }
    
}

