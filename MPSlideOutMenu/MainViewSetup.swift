//
//  MainViewSetup.swift
//  MPSlideOutMenu
//
//  Created by Marian on 13/10/2017.
//  Copyright © 2017 MarianP. All rights reserved.
//

import UIKit

class MainViewSetup: NSObject {

    var mainViewVC : MainViewVC?
    
    let containerView : UIView = {
        let container = UIView()
        container.backgroundColor = .yellow
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let containerViewSlide : UIView = {
        let container = UIView()
        container.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    func setupViews() {
        print("setup MAIN")
        
        mainViewVC?.view.addSubview(containerView)
        mainViewVC?.view.addSubview(containerViewSlide)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: (mainViewVC?.view.centerXAnchor)!),
            containerView.centerYAnchor.constraint(equalTo: (mainViewVC?.view.centerYAnchor)!),
            containerView.heightAnchor.constraint(equalTo: (mainViewVC?.view.heightAnchor)!),
            containerView.widthAnchor.constraint(equalTo: (mainViewVC?.view.widthAnchor)!)
            ])
        
        NSLayoutConstraint.activate([
            containerViewSlide.centerXAnchor.constraint(equalTo: (mainViewVC?.view.centerXAnchor)!),
            containerViewSlide.centerYAnchor.constraint(equalTo: (mainViewVC?.view.centerYAnchor)!),
            containerViewSlide.heightAnchor.constraint(equalTo: (mainViewVC?.view.heightAnchor)!),
            containerViewSlide.widthAnchor.constraint(equalTo: (mainViewVC?.view.widthAnchor)!)
            ])
    }
}
