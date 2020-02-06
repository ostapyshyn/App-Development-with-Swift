//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Volodymyr Ostapyshyn on 06.02.2020.
//

import Foundation
import UIKit

class AthleteFormViewController: UIViewController {
    var athlete: Athlete?
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var leagueField: UITextField!
    @IBOutlet var teamField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    
    
    
    func updateView() {
        if let theAthlete = athlete {
            nameField.text = theAthlete.name
            ageField.text = "\(theAthlete.age)"
            leagueField.text = theAthlete.league
            teamField.text = theAthlete.team
            
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameField.text,
            let ageText = ageField.text,
            let age = Int(ageText),
            let league = leagueField.text,
            let team = teamField.text else {return}
        
        athlete = Athlete(name: name, age: age, team: team, league: league)
        performSegue(withIdentifier: "AthleteList", sender: self)
    }
    
    
    
    
    
}
