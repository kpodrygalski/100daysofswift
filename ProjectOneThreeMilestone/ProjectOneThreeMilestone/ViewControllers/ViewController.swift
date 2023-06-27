//
//  ViewController.swift
//  ProjectOneThreeMilestone
//
//  Created by Konrad Podrygalski on 26/06/2023.
//

import UIKit

class ViewController: UITableViewController {
    var flagPictures: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let flagItems = try! fileManager.contentsOfDirectory(atPath: path)
        
        // Load flags names into array
        for flag in flagItems {
            if flag.hasPrefix("flag") {
                flagPictures.append(flag)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagPictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = flagPictures[indexPath.row]
        content.image = UIImage(named: flagPictures[indexPath.row])
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let flagDetailVC = storyboard?.instantiateViewController(withIdentifier: "FlagDetail") as? FlagDetailViewController {
            flagDetailVC.selectedFlagImage = flagPictures[indexPath.row]
            flagDetailVC.selectedFlagName = flagPictures[indexPath.row]
            navigationController?.pushViewController(flagDetailVC, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    private func setupNavigationBar() {
        title = "Flags Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

