//
//  ViewController.swift
//  ProjectFour
//
//  Created by Konrad Podrygalski on 03/07/2023.
//

// KVO - Key Value Observing

import UIKit


class ViewController: UITableViewController {
    let websites: [String] = ["apple.com", "hackingwithswift.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Websites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = websites[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebsiteDetailView") as? WebsiteViewController {
            vc.selectedWebsite = websites[indexPath.row]
            vc.allowedWebsites = websites
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
