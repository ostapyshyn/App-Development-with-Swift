//
//  Game.swift
//  Apple Pie
//
//  Created by Volodymyr Ostapyshyn on 17.01.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
      guessedLetters.append(letter)
      if !word.contains(letter) {
        incorrectMovesRemaining -= 1
      }
    }
    

}

