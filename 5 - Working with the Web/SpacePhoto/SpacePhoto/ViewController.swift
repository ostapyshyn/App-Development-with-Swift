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
                    self.updateUI(with: photoInfo)
                case .failure(let error):
                    self.updateUI(with: error)
                }
            }
        }
        
        
    }
    
    func updateUI(with error: Error) {
        title = "Error Fetching Photo"
        spaceImage.image = UIImage(systemName: "exclamationmark.octagon")
        descriptionLabel.text = error.localizedDescription
        copyrightLabel.text = ""
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        photoInfoController.fetchImage(from: photoInfo.url) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.title = photoInfo.title
                    self.spaceImage.image = image
                    self.descriptionLabel.text = photoInfo.description
                    self.copyrightLabel.text = photoInfo.copyright
                case .failure(let error):
                    self.updateUI(with: error)
                }
            }
        }
    }
    
        


}

