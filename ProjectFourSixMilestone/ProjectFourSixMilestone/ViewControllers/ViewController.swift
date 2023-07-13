//
//  ViewController.swift
//  ProjectFourSixMilestone
//
//  Created by Konrad Podrygalski on 13/07/2023.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupNavigationBarItems()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return "Shopping List"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return "Shopping List"
    }
    
    private func setupNavigationBarItems() {
        let addNewItemButton = UIBarButtonItem(barButtonSystemItem: .add,
                                               target: self,
                                               action: #selector(addNewItem))
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action,
                                          target: self,
                                          action: #selector(shareButtonTaped))
        
        navigationItem.rightBarButtonItems = [addNewItemButton, shareButton]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                           target: self,
                                                           action: #selector(clearList))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopItemCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = shoppingList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    private func canAddItem(item: String) -> Bool {
        if (!shoppingList.contains(item)) {
            return true
        }
        
        return false
    }
    
    private func isValidName(item: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: item.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: item,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        
        if item.count < 3 {
            return false
        }
        
        return misspelledRange.location == NSNotFound
    }
    
    private func saveItemToShoppingList(item: String) {
        if canAddItem(item: item) {
            if isValidName(item: item) {
                shoppingList.insert(item, at: 0)
                
                let indexPath = IndexPath(row: 0, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                return
            } else {
                showAlert(title: "Name too short.",
                          message: "Provided item name is too short. Please use name with min. 3 characters.")
            }
        } else {
            showAlert(title: "Item exists.",
                      message: "\(item) exist in list.")
        }
    }
    
    @objc private func addNewItem() {
        let ac = UIAlertController(title: "Add item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let addItem = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            self?.saveItemToShoppingList(item: item)
        }
        
        ac.addAction(addItem)
        present(ac, animated: true)
    }
    
    @objc private func clearList() {
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
    @objc private func shareButtonTaped() {
        let list = shoppingList.joined(separator: "\n")
        
        let vc = UIActivityViewController(activityItems: ["Share items", list], applicationActivities: nil)
    
        vc.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
    private func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
}

