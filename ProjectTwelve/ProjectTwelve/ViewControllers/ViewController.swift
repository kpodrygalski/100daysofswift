//
//  ViewController.swift
//  ProjectTwelve
//
//  Created by Konrad Podrygalski on 07/08/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        // Write to UserDefaults
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseFaceId")
        
        
        defaults.set("Konrad Podrygalski", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")
        
        let dict = ["Name": "Konrad", "Country": "PL"]
        defaults.set(dict, forKey: "SavedDictionary")
        
        // Reading from UserDefaults
        let savedInt = defaults.integer(forKey: "Age")
        let savedBoolean = defaults.bool(forKey: "UseFaceId")
        
        // Read array
        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
    
        // Read dictionary
        let savedDictionary = defaults.object(forKey: "SavedDictionary") as? [String:String] ?? [String:String]()
        
    }
    
    
}

