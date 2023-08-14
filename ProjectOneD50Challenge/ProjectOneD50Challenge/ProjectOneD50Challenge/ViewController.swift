//
//  ViewController.swift
//  ProjectOne
//
//  Created by Konrad Podrygalski on 15/06/2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [StormImage]()
    
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
                    let imageItem = StormImage(imageName: item, viewCount: 0)
                    self?.pictures.append(imageItem)
                }
            }
            
            self?.pictures.sort()
        }
        
        //    Day_41 - Reloading table view one loading data was finished.
        tableView.reloadData()
        
        let defaults = UserDefaults.standard
        if let savedImages = defaults.object(forKey: "images") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                pictures = try jsonDecoder.decode([StormImage].self, from: savedImages)
                tableView.reloadData()
            } catch {
                print("Failed to load images.")
            }
        }
        
        
    }
    
    //    numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //    cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath)
        let image = pictures[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = image.imageName
        content.secondaryText = "Views: \(image.viewCount)"
        
        cell.contentConfiguration = content
        return cell
    }
    
    //    didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        Identifier: Detail was setup in Main.storyboard in Storyboard ID
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let image = pictures[indexPath.row]
            image.viewCount += 1
            
            vc.selectedImage = image.imageName
            vc.selectedImageNumber = indexPath.row + 1 // We start counting from 1 in vc - not 0.
            vc.totalImagesCount = pictures.count
            
            save()
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
    
    private func save() {
        let jsonEncoder = JSONEncoder()
        if let savedImageViewCount = try? jsonEncoder.encode(pictures) {
            let defaults = UserDefaults.standard
            defaults.set(savedImageViewCount, forKey: "images")
        } else {
            print("Failed to save images data.")
        }
    }
}

