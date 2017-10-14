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
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    
    func viewTapped() {
        print("just tapped the view")
        NotificationCenter.default.post(name: NSNotification.Name("ViewTapped"), object: nil)
    }
    
    func buttonTapped() {
        print("menu pressed ---> notification")
        NotificationCenter.default.post(name: NSNotification.Name("ToogleMenu"), object: nil)
    }
    
   
}
