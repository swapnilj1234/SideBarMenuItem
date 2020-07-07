//
//  SideMenu.swift
//  Menu_SideBar_Ios_Academy
//
//  Created by swapnil jadhav on 07/07/20.
//  Copyright © 2020 t. All rights reserved.
//

import Foundation
import UIKit

protocol MenuControllerDelegate {
    
    func didSelectMenuItem(named:SideMenuItem)
}

enum SideMenuItem : String, CaseIterable
{
    case home = "Home"
    case info = "Info"
    case setting = "Setting"
}
class MenuController : UITableViewController
    
{
    
    public var delegate : MenuControllerDelegate?
    
    private let menuItem : [SideMenuItem]
    
    private let color =  UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)

    
    
    
    init(with menuItem : [SideMenuItem])
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
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    
    
    //tables
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return menuItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:  indexPath)
        
        cell.textLabel?.text = menuItem[indexPath.row].rawValue
        
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        
        cell.contentView.backgroundColor = color
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //relay to delegate about menu item select item
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectItem = menuItem[indexPath.row]
        
        delegate?.didSelectMenuItem(named: selectItem)
        
    }
}



