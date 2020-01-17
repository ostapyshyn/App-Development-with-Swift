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
    var totalWins = 0
    var totalLosses = 0
    

   
    
    
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
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    
    var currentGame: Game!

    func newRound() {
        let newWord = listsOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
        
        
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        
    }
    
    
}

