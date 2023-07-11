//
//  ViewController.swift
//  ProjectSixB
//
//  Created by Konrad Podrygalski on 11/07/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
    }
    
    private func setupLabels() {
        let labelOne = UILabel()
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.backgroundColor = .red
        labelOne.text = "THESE1"
        labelOne.sizeToFit()
        
        let labelTwo = UILabel()
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.backgroundColor = .blue
        labelTwo.text = "ARE"
        labelTwo.sizeToFit()
        
        let labelThree = UILabel()
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        labelThree.backgroundColor = .systemMint
        labelThree.text = "SOME"
        labelThree.sizeToFit()
        
        let labelFour = UILabel()
        labelFour.translatesAutoresizingMaskIntoConstraints = false
        labelFour.backgroundColor = .cyan
        labelFour.text = "AWESOME"
        labelFour.sizeToFit()
        
        let labelFive = UILabel()
        labelFive.translatesAutoresizingMaskIntoConstraints = false
        labelFive.backgroundColor = .orange
        labelFive.text = "LABELS"
        labelFive.sizeToFit()
        
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(labelFour)
        view.addSubview(labelFive)
        
        let viewsDictionary = [
            "labelOne": labelOne,
            "labelTwo": labelTwo,
            "labelThree": labelThree,
            "labelFour": labelFour,
            "labelFive": labelFive
        ]
        
        // H: - Horizontal
        // | - Edge of view controller
        // [] - put item here
        for label in viewsDictionary.keys {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|",
                                                              options: [],
                                                              metrics: nil,
                                                              views: viewsDictionary))
        }
        
        // V: Vertical
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[labelOne]-[labelTwo]-[labelThree]-[labelFour]-[labelFive]",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewsDictionary))
    }
}

