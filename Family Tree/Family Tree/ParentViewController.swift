//
//  ViewController.swift
//  Family Tree
//
//  Created by Josh T. Barrett on 2/20/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var parents = ["Bob and Jenny", "Marty and Lisa", "Michael*", "Bill and Lynda", "Linda*", "Tony*"]
    
    var segues = ["BobSegue","MartySegue",nil,"BillSegue",nil,nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = parents[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(segues[indexPath.row] != nil){
            performSegue(withIdentifier: segues[indexPath.row]! , sender: nil)
        }
    }

}

