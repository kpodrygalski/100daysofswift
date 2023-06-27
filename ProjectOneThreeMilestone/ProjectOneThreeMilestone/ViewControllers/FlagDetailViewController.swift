//
//  FlagDetailViewController.swift
//  ProjectOneThreeMilestone
//
//  Created by Konrad Podrygalski on 26/06/2023.
//

import UIKit

class FlagDetailViewController: UIViewController {
    @IBOutlet var flagImageView: UIImageView!
    var selectedFlagImage: String? = nil
    var selectedFlagName: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        if let flagImageToLoad = selectedFlagImage {
            flagImageView.image = UIImage(named: flagImageToLoad)
            flagImageView.layer.borderWidth = 1
            flagImageView.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    private func setupNavigationBar() {
        title = "Detail of: \(selectedFlagName ?? "unknown")"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc private func shareTapped() {
        guard
            let flagImage = flagImageView.image?.pngData(),
            let flagImageName = selectedFlagName
        else { return }
        
        let vc = UIActivityViewController(activityItems: [flagImage, flagImageName], applicationActivities: [])
        vc.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
