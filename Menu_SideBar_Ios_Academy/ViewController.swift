//
//  ViewController.swift
//  Menu_SideBar_Ios_Academy
//
//  Created by swapnil jadhav on 04/07/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit
import SideMenu
class ViewController: UIViewController {

    private var sideMenuBar = SideMenuNavigationController(rootViewController : UIViewController())
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuBar.leftSide = true
        SideMenuManager.default.leftMenuNavigationController  = sideMenuBar
        
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }

    @IBAction func didTappedMenubar(_ sender: UIBarButtonItem) {
        
        present(sideMenuBar,animated: true)
    }
    
}


