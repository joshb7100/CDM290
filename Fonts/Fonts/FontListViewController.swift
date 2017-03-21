//
//  FontListViewController.swift
//  Fonts
//
//  Created by Robert Barrett on 3/20/17.
//  Copyright © 2017 Josh Barrett. All rights reserved.
//

import UIKit

class FontListViewController: UITableViewController {
    var fontNames:[String] = []
    var showsFavorites:Bool = false
    private var cellPointSize: CGFloat!
    private static let cellIdentifier = "FontName"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fontForDisplay(atIndexPath indexPath:NSIndexPath)-> UIFont{
        let fontName = fontNames[indexPath.row]
        return UIFont(name: fontName, size: cellPointSize)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if showsFavorites{
            fontNames = FavoritesList.sharedFavoritesList.favorites
            tableView.reloadData()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fontNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontListViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
        cell.textLabel?.text = fontNames[indexPath.row]
        return cell
    }
    
}
