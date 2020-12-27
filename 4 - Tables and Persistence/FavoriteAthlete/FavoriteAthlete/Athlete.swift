//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Volodymyr Ostapyshyn on 27.12.2020.
//

import Foundation

struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
