//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Komin on 2/1/2560 BE.
//  Copyright © 2560 Banana Software Co., Ltd. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
//            table.reloadData()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            UserDefaults.standard.set(items, forKey: "items")
        }
        
    }

}

