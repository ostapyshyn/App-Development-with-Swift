//
//  ViewController.swift
//  ARImageFinder.
//
//  Created by Volodymyr Ostapyshyn on 02.02.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)!
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else {
                return
            }
       let referenceImage = imageAnchor.referenceImage
       
           let plane = SCNPlane(width:
              referenceImage.physicalSize.width,
                                height:
                                   referenceImage.physicalSize.height)
           plane.firstMaterial?.diffuse.contents = UIColor.blue
           let planeNode = SCNNode(geometry: plane)
           planeNode.opacity = 0.75
            planeNode.eulerAngles.x = -Float.pi / 2

           node.addChildNode(planeNode)
        
  
            //planeNode.runAction(waitRemoveAction)
      
    }
    
    
    
    var waitRemoveAction: SCNAction {
        return .sequence([.wait(duration: 5.0), .fadeOut(duration:
           2.0), .removeFromParentNode()])
    }
   
    
    func nodeAdded(_ node: SCNNode, for planeAnchor: ARPlaneAnchor)
       {
        // Handle plane detection
    }
    
    
    
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
