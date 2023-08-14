//
//  ViewController.swift
//  MilestoneProjectTenTwelve
//
//  Created by Konrad Podrygalski on 09/08/2023.
//

import UIKit

class ViewController: UITableViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
    let cellIdentifier: String = "Item"
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add right bar item
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addItem))
        
        let defaults = UserDefaults.standard
        if let savedItems = defaults.object(forKey: "items") as? Data {
            do {
                items = try JSONDecoder().decode([Item].self, from: savedItems)
            } catch {
                print("Failed to load items.")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let item = items[indexPath.row]
        let path = getDocumentsDirectory().appending(path: item.image)
        
        var content = cell.defaultContentConfiguration()
        content.text = item.name
        
        content.image = UIImage(contentsOfFile: path.path)
        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        content.imageProperties.cornerRadius = 7
        content.imageProperties.tintColor = .systemMint
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        let questionAlert = UIAlertController(title: "What to do?", message: nil, preferredStyle: .alert)
        questionAlert.addAction(UIAlertAction(title: "Show Details", style: .default, handler: { [weak self] _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detailViewController = storyboard.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController {
                detailViewController.selectedItem = item
                self?.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }))
        
        questionAlert.addAction(UIAlertAction(title: "Rename", style: .default, handler: { [weak self] _ in
            let renameAlert = UIAlertController(title: "Rename item", message: nil, preferredStyle: .alert)
            renameAlert.addTextField()
            
            renameAlert.addAction(UIAlertAction(title: "Rename", style: .default, handler: { [weak self, weak renameAlert] _ in
                guard let itemName = renameAlert?.textFields?[0].text else { return }
                item.name = itemName
                self?.saveItem()
                self?.tableView.reloadData()
            }))
            
            renameAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self?.present(renameAlert, animated: true)
        }))
        
        questionAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(questionAlert, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appending(path: imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let item = Item(name: "Unknown", image: imageName)
        items.append(item)
        saveItem()
        tableView.reloadData()
        
        dismiss(animated: true)
    }
    
    @objc private func addItem() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        
        present(picker, animated: true)
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func saveItem() {
        if let savedData = try? JSONEncoder().encode(items) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "items")
        } else {
            print("Failed to save items.")
        }
    }
    
}

