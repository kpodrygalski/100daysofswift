//
//  ViewController.swift
//  ProjectOne
//
//  Created by Konrad Podrygalski on 15/06/2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
//      Day_22 - 2. Go back to project 1 and add a bar button item to the main view controller that recommends the app to other people.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendApp))
//        Day_41 - Loading NSSL images on background thread
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let fm = FileManager.default // Create a file manager.
            let path = Bundle.main.resourcePath! // Declare path to apps bundle.
            let items = try! fm.contentsOfDirectory(atPath: path) // Grab contents from directory at given path.
            
    //        Loop over items directory and append to pictures array.
            for item in items {
                if item.hasPrefix("nssl") {
                    self?.pictures.append(item)
                }
            }
            
            self?.pictures.sort()
        }
//    Day_41 - Reloading table view one loading data was finished.
        tableView.reloadData()
    }
        
//    numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
//    cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
//    didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        Identifier: Detail was setup in Main.storyboard in Storyboard ID 
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedImageNumber = indexPath.row + 1 // We start counting from 1 in vc - not 0.
            vc.totalImagesCount = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func recommendApp() {
        let ac = UIAlertController(title: "Recommend App",
                                   message: "If you enjoy this app, share it with your friends ☺️",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(ac, animated: true)
    }
}

