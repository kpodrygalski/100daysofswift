//
//  DetailViewController.swift
//  ProjectThree
//
//  Created by Konrad Podrygalski on 23/06/2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImageNumber: Int = 0
    var totalImagesCount: Int    = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Picture \(selectedImageNumber) of \(totalImagesCount)"
        navigationItem.largeTitleDisplayMode = .never
//        Adding UIBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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
    
    @objc private func shareTapped() {
//        Day 22 - 1. Try adding the image name to the list of items that are shared. The activityItems parameter is an array, so you can add strings and other things freely.
//        Note: Facebook won’t let you share text, but most other share options will.
        guard
            let image = imageView.image?.jpegData(compressionQuality: 0.8),
            let imageName = selectedImage
        else { return }
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
//        barButtonItem = Deprecated
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        vc.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
