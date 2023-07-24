//
//  ViewController.swift
//  ProjectNine
//
//  Created by Konrad Podrygalski on 24/07/2023.
//

import UIKit

// URL: https://hackingwithswift.com/samples/petitions-1.json

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        performSelector(inBackground: #selector(fetchJsonData), with: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let petition = filteredPetitions[indexPath.row]
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
            filteredPetitions = petitions
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData),
                                      with: nil,
                                      waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showError),
                            with: nil,
                            waitUntilDone: false)
        }
    }
    
    @objc private func fetchJsonData() {
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://hackingwithswift.com/samples/petitions-2.json"
        }
        
//        Push to background thread
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // Parse data
                parse(json: data)
                return
            }
        }
        
        performSelector(onMainThread: #selector(showError),
                        with: nil,
                        waitUntilDone: false)
    }
    
    @objc private func showError() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let ac = UIAlertController(title: "Loading error",
                                       message: "There was a problem loading the feed; Please check your connection and try again.",
                                       preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    @objc private func showCreditsTapped() {
        let ac = UIAlertController(title: "Credits",
                                   message: "Data comes from: We The People API of the Whitehouse.",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    private func search(searchText: String) {
        filteredPetitions = petitions.filter { $0.title.contains(searchText) || $0.body.contains(searchText) }
        if !filteredPetitions.isEmpty {
            tableView.reloadData()
        } else {
            filteredPetitions = petitions
        }
    }
    
    @objc private func promptForSearch() {
        let ac = UIAlertController(title: "Search petitons",
                                   message: nil,
                                   preferredStyle: .alert)
        ac.addTextField()
        
        let searchAction = UIAlertAction(title: "Search", style: .default) { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text else { return }
            
            if text.isEmpty {
                let emptyTextErrorAlert = UIAlertController(title: "Text is empty", message: "Please enter valid search text phrase.", preferredStyle: .alert)
                emptyTextErrorAlert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self?.present(emptyTextErrorAlert, animated: true)
            }
            
            self?.search(searchText: text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
            self?.fetchJsonData()
        }
        
        ac.addAction(searchAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
    }
    
    private func setupNavigationBarItems() {
        let creditsButton = UIBarButtonItem(title: "Credits",
                                            style: .plain,
                                            target: self,
                                            action: #selector(showCreditsTapped))
            
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search,
                                           target: self, action: #selector(promptForSearch))
        
        navigationItem.rightBarButtonItems = [creditsButton, searchButton]
    }
}

