//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Volodymyr Ostapyshyn on 24.01.2021.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var detailTextLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!
    
    let menuItem: MenuItem!
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    func updateUI() {
        nameLabel.text = menuItem.name
        priceLabel.text = MenuItem.priceFormatter.string(from:
           NSNumber(value: menuItem.price))
        detailTextLabel.text = menuItem.detailText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0,
           usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1,
           options: [], animations: {
            self.addToOrderButton.transform =
               CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.addToOrderButton.transform =
               CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
