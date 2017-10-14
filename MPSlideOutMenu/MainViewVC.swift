//
//  ViewController.swift
//  MPSlideOutMenu
//
//  Created by Marian on 13/10/2017.
//  Copyright © 2017 MarianP. All rights reserved.
//

import UIKit


var windowSize = CGFloat()
public var menuWidthGap : CGFloat = 70

class MainViewVC: UIViewController {

    let setupMainView = MainViewSetup()
    
    var menuXConstant : NSLayoutConstraint!
    var viewXConstant : NSLayoutConstraint!
    var rightViewX : NSLayoutConstraint!
    
    var slideMenuOpen = false
    var rightMenuOpen = false
    
    var centerX = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the window
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        view.backgroundColor = UIColor.white
        
        navigationController?.isNavigationBarHidden = true
       
        NotificationCenter.default.addObserver(self, selector: #selector(menuButtonAction), name: NSNotification.Name("ToogleMenu"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tapSelectedCell), name: NSNotification.Name("SelectedCell"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewTapped), name: NSNotification.Name("ViewTapped"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(rightViewTapped), name: NSNotification.Name("RightViewTapped"), object: nil)
        
        setupMainView.mainViewVC = self
        setupMainView.setupViews()
        
        setupRightViewController()
        setupViewController()
        
        setupMenuViewController()
        
        
        windowSize = window.frame.size.width
        
        menuXConstant.constant = -windowSize
        viewXConstant.constant = 0
        rightViewX.constant = 0
        
        print(window.frame.size.width)
        
//        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleLeftEdgeGesture))
//        edgePan.edges = .left
//        edgePan.delegate = self as? UIGestureRecognizerDelegate
//        view.addGestureRecognizer(edgePan)
//        
//        centerX = self.view.frame.size.width
        
    }
    
//    func handleLeftEdgeGesture(_ gesture: UIScreenEdgePanGestureRecognizer) {
//        // Get the current view we are touching
//        let view: UIView? = self.view.hitTest(gesture.location(in: gesture.view), with: nil)
//        if .began == gesture.state || .changed == gesture.state {
//            let translation: CGPoint = gesture.translation(in: gesture.view)
//            // Move the view's center using the gesture
//            view?.center = CGPoint(x: centerX + translation.x, y: (view?.center.y)!)
//        }
//        else {
//            // cancel, fail, or ended
//            // Animate back to center x
//            UIView.animate(withDuration: 0.3, animations: {() -> Void in
//                view?.center = CGPoint(x: self.centerX, y: (view?.center.y)!)
//            })
//        }
//    }
//    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        // You can customize the way in which gestures can work
//        // Enabling multiple gestures will allow all of them to work together, otherwise only the topmost view's gestures will work (i.e. PanGesture view on bottom)
//        return true
//    }
    
//    func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
//        if recognizer.state == .recognized {
//            print("Screen edge swiped!")
//            
//            view.frame.origin.x += setupMainView.containerView.frame.origin.x
//        }
//    }
    
    func rightViewTapped() {
        print("right view notification...")
        
        if rightMenuOpen {
            rightMenuOpen = false
            self.viewXConstant.constant = 0
        } else {
            rightMenuOpen = true
            self.viewXConstant.constant = -windowSize + menuWidthGap
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }

    }
    
    func viewTapped() {
        slideMenuOpen = false
        rightMenuOpen = false
        self.menuXConstant.constant = -windowSize
        self.viewXConstant.constant = 0
        
        UIView.animate(withDuration: 0.3) {
            
            self.view.layoutIfNeeded()
            
        }

    }
    
    
    
    func tapSelectedCell() {
        print("tap to close")
        let window = UIScreen.main.bounds
        self.setupMainView.containerView.frame.size.width = window.width
        
        slideMenuOpen = false
        self.menuXConstant.constant = 0
        self.viewXConstant.constant = windowSize
        
        UIView.animate(withDuration: 0.3) {
            
            self.view.layoutIfNeeded()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.menuXConstant.constant = -windowSize
                    self.viewXConstant.constant = 0
                    self.view.layoutIfNeeded()
                })
            })
            
        }
        
    }
    
    func menuButtonAction() {
        print("MENU TOOGLE")
        
        if slideMenuOpen {
            slideMenuOpen = false
            self.menuXConstant.constant = -windowSize
            self.viewXConstant.constant = 0
        } else {
            slideMenuOpen = true
            self.menuXConstant.constant = -menuWidthGap
            self.viewXConstant.constant = windowSize - menuWidthGap
        }
        
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
        }
        
    }
    
    //MARK: Left View
    func setupMenuViewController() {
        let controller = MenuLeftVC()
        addChildViewController(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        menuXConstant = controller.view.centerXAnchor.constraint(equalTo: setupMainView.containerView.centerXAnchor, constant: 0)
        menuXConstant.isActive = true

        controller.view.centerYAnchor.constraint(equalTo: setupMainView.containerView.centerYAnchor).isActive = true
        controller.view.heightAnchor.constraint(equalTo: setupMainView.containerView.heightAnchor).isActive = true
        controller.view.widthAnchor.constraint(equalTo: setupMainView.containerView.widthAnchor).isActive = true
        
        controller.didMove(toParentViewController: self)
    }
    
    //MARK: Right View
    func setupRightViewController() {
        let controller = RightViewVC()
        addChildViewController(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        rightViewX = controller.view.rightAnchor.constraint(equalTo: setupMainView.containerView.rightAnchor, constant: 0)
        rightViewX.isActive = true
        
        controller.view.centerYAnchor.constraint(equalTo: setupMainView.containerView.centerYAnchor).isActive = true
        controller.view.heightAnchor.constraint(equalTo: setupMainView.containerView.heightAnchor).isActive = true
        controller.view.widthAnchor.constraint(equalTo: setupMainView.containerView.widthAnchor).isActive = true
        
        controller.didMove(toParentViewController: self)
    }
    
    //MARK: Middle View
    func setupViewController() {
        let controller = AnotherViewVC()
        
        let navBar: UINavigationController = UINavigationController(rootViewController: controller)
        addChildViewController(navBar)
        navBar.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar.view)
        
        viewXConstant = navBar.view.leftAnchor.constraint(equalTo: setupMainView.containerViewSlide.leftAnchor, constant: 0)
        viewXConstant.isActive = true
        
        navBar.view.centerYAnchor.constraint(equalTo: setupMainView.containerViewSlide.centerYAnchor).isActive = true
        navBar.view.heightAnchor.constraint(equalTo: setupMainView.containerViewSlide.heightAnchor).isActive = true
        navBar.view.widthAnchor.constraint(equalTo: setupMainView.containerViewSlide.widthAnchor).isActive = true
        
        
        
        navBar.didMove(toParentViewController: self)
    }
    
    

}

