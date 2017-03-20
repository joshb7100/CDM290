//
//  ViewController.swift
//  GameInfoJoshB
//
//  Created by Josh Barrett on 3/19/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ESRBLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let gameTableIdentifier = "gameTableIdentifier"
    
    let games:[String] = ["Zelda Triforce Heroes","Pokemon Super Mystery Dungeon","Super Mario 3D Land","Super Smash Bros 3DS","Mario & Luigi Dream Team","Luigi's Mansion: Dark Moon","Pokemon Omega Ruby","Fire Emblem Awakening","Zelda: A Link Between Worlds", "Paper Mario Sticker Star", "Bravely Default","New Super Mario Bros 2","Zelda: Majoras Mask","Kirby Triple Deluxe"]
    let gameYears:[Int] = [2015,2015,2011,2014,2013,2013,2014,2013,2013,2012,2014,2012,2015,2014]
    let ESRB:[String] = ["E","E","E","E 10+","E 10+","E","E","T","E","E","T","E","E 10+","E"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: gameTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameTableIdentifier")
        cell!.textLabel?.text = games[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gameLabel.text = games[indexPath.row]
        yearLabel.text = String(gameYears[indexPath.row])
        ESRBLabel.text = ESRB[indexPath.row]
    }
}

