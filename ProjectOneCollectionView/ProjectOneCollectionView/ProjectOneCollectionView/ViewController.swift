//
//  ViewController.swift
//  ProjectOneCollectionView
//
//  Created by Konrad Podrygalski on 01/08/2023.
//

import UIKit

class ViewController: UICollectionViewController {
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

        collectionView.reloadData()
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo", for: indexPath) as? PhotoCell else {
            fatalError("Failed to dequeue PhotoCell.")
        }
        
        let picture = pictures[indexPath.item]
        
        cell.imageView.image = UIImage(named: picture)
        cell.name.text = picture
        cell.name.textColor = .blue
        
        return cell
    }
            
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.item]
            vc.selectedImageNumber = indexPath.item + 1 // We start counting from 1 in vc - not 0.
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

