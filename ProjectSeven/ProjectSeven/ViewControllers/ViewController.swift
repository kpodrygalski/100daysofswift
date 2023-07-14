//
//  ViewController.swift
//  ProjectSeven
//
//  Created by Konrad Podrygalski on 14/07/2023.
//

import UIKit

// URL: https://hackingwithswift.com/samples/petitions-1.json

class ViewController: UITableViewController {
    var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchJsonData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let petition = petitions[indexPath.row]
        content.text = petition.title
        content.secondaryText = petition.body
        cell.contentConfiguration = content
        return cell
    }
    
    private func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPettitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPettitions.results
            tableView.reloadData()
        }
    }
    
    private func fetchJsonData() {
        let urlString = "https://hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // Parse data
                parse(json: data)
            }
        }
    }
}

