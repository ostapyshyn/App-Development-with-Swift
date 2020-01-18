//
//  ViewController.swift
//  Apple Pie
//
//  Created by Volodymyr Ostapyshyn on 17.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listsOfWords = ["swift", "bug", "program", "mouse", "cat", "computer", "apple"]
    
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    

 
    

   
    
    
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
        updateUI()
    }
    
    func updateUI() {
       var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing

        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
          } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
          } else {
            updateUI()
          }
        
        
        
    }


    
    var currentGame: Game!

    func newRound() {
        if !listsOfWords.isEmpty {
                let newWord = listsOfWords.removeFirst()
                currentGame = Game(word: newWord,
                incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
                enableLetterButtons(true)
                updateUI()
            } else {
                enableLetterButtons(false)
            }
        
        
    }
    
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButtons {
        button.isEnabled = enable
      }
    }
    

    


    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        
    }
    
    
}

