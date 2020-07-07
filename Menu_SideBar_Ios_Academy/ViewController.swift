//
//  ViewController.swift
//  Menu_SideBar_Ios_Academy
//
//  Created by swapnil jadhav on 04/07/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit
import SideMenu
class ViewController: UIViewController ,MenuControllerDelegate {
    
    

    private var sideMenuBar : SideMenuNavigationController?
    
    private let settingViewController = SettingViewController()
    private let infoViewController =    InfoViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = MenuController(with: SideMenuItem.allCases)
        
        
        menu.delegate = self
        
        
        sideMenuBar = SideMenuNavigationController(rootViewController: menu)
        sideMenuBar?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController  = sideMenuBar
        
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildController()
        
    }
    
    private func addChildController()
    {
        addChild(settingViewController)
        addChild(infoViewController)
        
        view.addSubview(settingViewController.view)
        view.addSubview(infoViewController.view)
        
        
        settingViewController.view.frame = view.bounds
        infoViewController.view.frame = view.bounds
        
        
        settingViewController.didMove(toParent: self)
        infoViewController.didMove(toParent: self)
        
        settingViewController.view.isHidden = true
        infoViewController.view.isHidden = true
    }
    

    @IBAction func didTappedMenubar(_ sender: UIBarButtonItem) {
        
        present(sideMenuBar!,animated: true)
    }
    
    func didSelectMenuItem(named: SideMenuItem) {
          
        sideMenuBar?.dismiss(animated: true, completion: nil)
        
        title = named.rawValue
        
        switch named {
        
        case .home :
            settingViewController.view.isHidden = true
            infoViewController.view.isHidden = true
       
        case .info :
            settingViewController.view.isHidden = true
            infoViewController.view.isHidden = false
            
        case .setting :
            settingViewController.view.isHidden = false
            infoViewController.view.isHidden = true
        
      }
    
    
 }
}
