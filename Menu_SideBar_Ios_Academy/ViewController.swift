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
class MenuController : UITableViewController
    
{
    private let menuItem : [String]
    
   
    init(with menuItem : [String])
    {
        
        self.menuItem = menuItem
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //tables
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return menuItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:  indexPath)
        
        cell.textLabel?.text = menuItem[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //relay to delegate about menu item select item
    }
}



