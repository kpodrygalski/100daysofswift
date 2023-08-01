//
//  DetailViewController.swift
//  ProjectOneCollectionView
//
//  Created by Konrad Podrygalski on 01/08/2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImageNumber: Int = 0
    var totalImagesCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Picture \(selectedImageNumber) of \(totalImagesCount)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
