//
//  ViewController.swift
//  MilestoneProjectSevenNine
//
//  Created by Konrad Podrygalski on 26/07/2023.
//

import UIKit

class ViewController: UIViewController {
    var words = [String]()
    var usedLetters = [Character]()
    var word: String = ""
    var selectedWordLabel: UILabel!
    var scoreLabel: UILabel!
    var wrongAnswersLabel: UILabel!
    var promptText: String = ""
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    let maxWrongAttempts: Int = 7
    var wrongAnswers: Int = 0 {
        didSet {
            wrongAnswersLabel.text = "Wrong answer \(wrongAnswers) of \(maxWrongAttempts)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRandomWord()
        setupUI()
    }
    
    private func loadRandomWord() {
        //        Load words from hangman.txt file in background thread.
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self else { return }
            if let startWordsURL = Bundle.main.url(forResource: "hangman", withExtension: "txt") {
                if let startWords = try? String(contentsOf: startWordsURL) {
                    self.words = startWords.components(separatedBy: "\n")
                }
                
                if self.words.isEmpty {
                    self.words = ["TestWord"]
                }
            }
            
            self.word = self.words.randomElement() ?? "TEST"
        }
        
        print(word)
    }
    
    private func setupUI() {
        //        MARK: scoreLabel
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score: 0"
        scoreLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.addSubview(scoreLabel)
        
        //        MARK: wrongAnswersLabel
        wrongAnswersLabel = UILabel()
        wrongAnswersLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongAnswersLabel.textAlignment = .right
        wrongAnswersLabel.text = "Wrong answers: 0 of \(maxWrongAttempts)"
        wrongAnswersLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.addSubview(wrongAnswersLabel)
        
        //        MARK: selectedWordLabel
        selectedWordLabel = UILabel()
        selectedWordLabel.translatesAutoresizingMaskIntoConstraints = false
        selectedWordLabel.text = ""
        selectedWordLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.addSubview(selectedWordLabel)
        
        //        MARK: answerButton
        let answerButton = UIButton(type: .system)
        answerButton.translatesAutoresizingMaskIntoConstraints = false
        answerButton.setTitle("Answer", for: .normal)
        answerButton.addTarget(self, action: #selector(promptUserInput), for: .touchUpInside)
        view.addSubview(answerButton)
        
        //        MARK: resetGameButton
        let resetGameButton = UIButton(type: .system)
        resetGameButton.translatesAutoresizingMaskIntoConstraints = false
        resetGameButton.setTitle("Reset", for: .normal)
        resetGameButton.addTarget(self, action: #selector(resetGame), for: .touchUpInside)
        view.addSubview(resetGameButton)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            wrongAnswersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            wrongAnswersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            selectedWordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedWordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            answerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            answerButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            resetGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            resetGameButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func submitAnswer(action: UIAlertAction) {
        //        Submit user answer
    }
    
    @objc private func promptUserInput() {
        //        Show UIAlertController with text field to input user answer.
        let ac = UIAlertController(title: "Enter letter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAnswerAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let self else { return }
            guard let answer = ac?.textFields?[0].text else { return }
            if answer.count == 1 {
                self.usedLetters.append(contentsOf: answer)
                for letter in self.word {
                    let strLetter = String(letter)
                    
                    if self.usedLetters.contains(strLetter) {
                        self.promptText += strLetter
                    } else {
                        self.promptText += "?"
                        self.selectedWordLabel.text! = self.promptText
                    }
                }
            }
        }
        
        ac.addAction(submitAnswerAction)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc private func resetGame() {
        //        Reset the game
        let ac = UIAlertController(title: "Reset current game?", message: "Do you want to reset current game?", preferredStyle: .alert)
        
        let resetGameAction = UIAlertAction(title: "Reset", style: .destructive) { [weak self] _ in
            guard let self else { return }
            self.score = 0
            self.word = ""
            self.selectedWordLabel.text = ""
            self.usedLetters.removeAll()
        }
        
        ac.addAction(resetGameAction)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

