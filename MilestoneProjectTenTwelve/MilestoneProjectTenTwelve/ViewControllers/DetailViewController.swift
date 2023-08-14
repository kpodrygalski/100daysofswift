//
//  DetailViewController.swift
//  MilestoneProjectTenTwelve
//
//  Created by Konrad Podrygalski on 09/08/2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemImage: UIImageView!
    var selectedItem: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = selectedItem {
            itemNameLabel.text = item.name
            let path = getDocumentsDirectory().appending(path: item.image)
            itemImage.image = UIImage(contentsOfFile: path.path)
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
