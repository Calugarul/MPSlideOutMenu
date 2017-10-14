//
//  AnotherViewVC.swift
//  MPSlideOutMenu
//
//  Created by Marian on 13/10/2017.
//  Copyright © 2017 MarianP. All rights reserved.
//

import UIKit

class AnotherViewVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the window
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Second View"
        
        view.backgroundColor = UIColor.blue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(buttonTapped))
        
        
    }
    
    func buttonTapped() {
        print("menu pressed ---> notification")
        NotificationCenter.default.post(name: NSNotification.Name("ToogleMenu"), object: nil)
    }
    
   
}
