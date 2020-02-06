//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Volodymyr Ostapyshyn on 06.02.2020.
//

import Foundation


struct Athlete {
   //my
    let name: String
    let age: Int
    let team: String
    let league: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
