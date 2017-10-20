//
//  SideBarViewController.swift
//  SideBarProject
//
//  Created by monk773 on 2017. 10. 20..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class SideBarViewController: UITableViewController {

    let titles = ["메뉴 01", "메뉴 02", "메뉴 03", "메뉴 04", "메뉴 05"]
    let icons = [
        UIImage(named: "icon01.png"),
        UIImage(named: "icon02.png"),
        UIImage(named: "icon03.png"),
        UIImage(named: "icon04.png"),
        UIImage(named: "icon05.png")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.7, height: view.frame.height)
        
        let accountLabel = UILabel(frame: CGRect(x: 10, y: 30, width: tableView.frame.width, height: 30))
        accountLabel.text = "sqlpro@naver.com"
        accountLabel.textColor = UIColor.white
        accountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70)
        v.backgroundColor = UIColor.brown
        v.addSubview(accountLabel)
        
        tableView.tableHeaderView = v
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "menucell"
//        var cell = tableView.dequeueReusableCell(withIdentifier: id)
//
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: id)
//        }

        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        cell.textLabel?.text = titles[indexPath.row]
        cell.imageView?.image = icons[indexPath.row]
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
}
