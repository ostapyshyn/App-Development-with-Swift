//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Volodymyr Ostapyshyn on 20.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let photoInfoController = PhotoInfoController()
    
    
    @IBOutlet var spaceImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        spaceImage.image = UIImage(systemName: "photo.on.rectangle")
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let photoInfo):
                    self.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description
                    self.copyrightLabel.text = photoInfo.copyright
                case .failure(let error):
                    self.title = "Error Fetching Photo"
                    self.spaceImage.image = UIImage(systemName: "exclamationmark.octagon")
                    self.descriptionLabel.text = error.localizedDescription
                    self.copyrightLabel.text = ""
                }
            }
        }
    }


}

