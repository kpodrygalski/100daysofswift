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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPettitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPettitions.results
            tableView.reloadData()
        }
    }
    
    private func fetchJsonData() {
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // Parse data
                parse(json: data)
                return
            }
        }
        
        showError()
    }
    
    private func showError() {
        let ac = UIAlertController(title: "Loading error",
                                   message: "There was a problem loading the feed; Please check your connection and try again.",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
    }
}

