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
        
        view.backgroundColor = UIColor.yellow
        navigationController?.isNavigationBarHidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
       
        
    }
    
    func panWithFinger(sender: UIPanGestureRecognizer) {
        print("started panning")
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("did apear")
        tableView.contentInset = UIEdgeInsetsMake(0, menuWidthGap, 0, -menuWidthGap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("will appear")
        tableView.contentInset = UIEdgeInsetsMake(0, menuWidthGap, 0, -menuWidthGap)
        
    }
    
    func selectCell() {
        print("selected cell - >")
        
        NotificationCenter.default.post(name: NSNotification.Name("SelectedCell"), object: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.isSelected = false
        tableView.contentInset = UIEdgeInsetsMake(0, menuWidthGap, 0, -menuWidthGap)

        
        cell.contentView.backgroundColor = UIColor.yellow
        cell.textLabel?.text = "Daim Boy"
        
        
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.red
        
        selectedCell.isSelected = false
        
        if selectedCell.isSelected == true {
        print("selection")
        if selectedCell.textLabel?.text == "Daim Boy" {
            print("cell is selected")
            UIView.animate(withDuration: 0.3, animations: {
                tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
                self.selectCell()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { 
                    self.viewWillAppear(true)
                })
                
                //selectedCell.isSelected = false
                
            })
            
        }
            
        }
        
        
    }
    
    
    
    

    
}
