//
//  ViewController.swift
//  ProjectTwo
//
//  Created by Konrad Podrygalski on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    
    var countries = [String]()
    var score: Int = 0
    var correctAnswer: Int = 0
    var askedQuestionCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        setupButtons()
        askQuestion(action: nil)
    }
    
    private func resetGame(action: UIAlertAction!) {
        score = 0
        askedQuestionCount = 0
        askQuestion(action: nil)
    }
    
    private func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
//        1. Try showing the player’s score in the navigation bar, alongside the flag to guess.
        title = countries[correctAnswer].uppercased() + " " + "(Score: \(score))"
               
//        2. Keep track of how many questions have been asked, and show one final alert controller after they have answered 10. This should show their final score.
        if askedQuestionCount == 10 {
            let finalAlertController = UIAlertController(title: "Total Score", message: "You answered for \(askedQuestionCount) questions. Your final score is: \(score) points. 🥳", preferredStyle: .alert)
            finalAlertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: resetGame))
            present(finalAlertController, animated: true)
        }
    }
    
    private func setupButtons() {
        buttonOne.layer.borderWidth = 1
        buttonTwo.layer.borderWidth = 1
        buttonThree.layer.borderWidth = 1
        
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "You are right 🥳."
            score += 1
            askedQuestionCount += 1
        } else {
//            3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
            title = "Wrong answer 🥹. That's the flag of: \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is: \(score).", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true)
    }
}

