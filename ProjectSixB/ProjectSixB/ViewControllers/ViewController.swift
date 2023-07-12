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
        labelOne.text = "THESE"
        labelOne.sizeToFit()
        
        let labelTwo = UILabel()
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.backgroundColor = .blue
        labelTwo.text = "ARE"
        labelTwo.sizeToFit()
        
        let labelThree = UILabel()
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        labelThree.backgroundColor = .green
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
        
//        let viewsDictionary = [
//            "labelOne": labelOne,
//            "labelTwo": labelTwo,
//            "labelThree": labelThree,
//            "labelFour": labelFour,
//            "labelFive": labelFive
//        ]
        
        // H: - Horizontal
        // | - Edge of view controller
        // [] - put item here
//        for label in viewsDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|",
//                                                              options: [],
//                                                              metrics: nil,
//                                                              views: viewsDictionary))
//        }
        
        // V: Vertical
//        let metrics = ["labelHeight": 88]
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[labelOne(labelHeight@999)]-[labelTwo(labelOne)]-[labelThree(labelOne)]-[labelFour(labelOne)]-[labelFive(labelOne)]-(>=10)-|",
//                                                           options: [],
//                                                           metrics: metrics,
//                                                           views: viewsDictionary))
        
        var previous: UILabel?
        
        for label in [labelOne, labelTwo, labelThree, labelFour, labelFive] {
//            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
            
//            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2, constant: 10).isActive = true
            
            if let previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = label
        }
    }
}

