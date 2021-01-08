//
//  RegistrationDetailsTableViewController.swift
//  HotelManzana
//
//  Created by Volodymyr Ostapyshyn on 08.01.2021.
//

import UIKit

class RegistrationDetailsTableViewController: UITableViewController {
    
    @IBOutlet var firstNamaLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var checkInLabel: UILabel!
    @IBOutlet var checkOutLabel: UILabel!
    @IBOutlet var adultsLabel: UILabel!
    @IBOutlet var childrenLabel: UILabel!
    @IBOutlet var wifiLabel: UILabel!
    @IBOutlet var roomLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
    
        return dateFormatter
    }()
    
    var registration: Registration?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    init?(coder: NSCoder, registration: Registration?) {
        self.registration = registration
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLabels() {
        firstNamaLabel.text = registration?.firstName
        lastNameLabel.text = registration?.lastName
        emailLabel.text = registration?.emailAddress
        checkInLabel.text = dateFormatter.string(from: registration!.checkInDate)
        checkOutLabel.text = dateFormatter.string(from: registration!.checkOutDate)
        adultsLabel.text = String(registration?.numberOfAdults ?? 1)
        childrenLabel.text = String(registration?.numberOfChildren ?? 1)
        
        roomLabel.text = registration?.roomType.name
        
        if ((registration?.wifi) != nil) {
            wifiLabel.text = "Yes"
        } else {
            wifiLabel.text = "No"
        }
        
    }
    // MARK: - Table view data source
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
