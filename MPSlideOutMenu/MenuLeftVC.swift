//
//  MenuLeftVC.swift
//  MPSlideOutMenu
//
//  Created by Marian on 13/10/2017.
//  Copyright © 2017 MarianP. All rights reserved.
//

import UIKit

class MenuLeftVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the window
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        view.backgroundColor = UIColor.red
        navigationController?.isNavigationBarHidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        tableView.contentInset = UIEdgeInsetsMake(0, menuWidthGap, 0, -menuWidthGap)
        
        cell.contentView.backgroundColor = UIColor.yellow
        cell.textLabel?.text = "Daim Boy"
        
        return cell
    }

    
}
