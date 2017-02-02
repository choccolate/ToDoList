//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Komin on 2/1/2560 BE.
//  Copyright © 2560 Banana Software Co., Ltd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(textInput.text!)
            
            print(items)
            
        } else {
            
            items = [textInput.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        textInput.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }

}

