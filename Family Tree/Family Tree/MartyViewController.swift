//
//  ViewController.swift
//  Family Tree
//
//  Created by Josh T. Barrett on 2/20/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class MartyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var martyKids = ["Bobby*", "Trevor*", "Josh*"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return martyKids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = martyKids[indexPath.row]
        return cell
    }
    
}

