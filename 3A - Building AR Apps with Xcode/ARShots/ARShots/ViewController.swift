//
//  ViewController.swift
//  ARShots
//
//  Created by Volodymyr Ostapyshyn on 01.02.2020.
//  Copyright © 2020 Volodymyr Ostapyshyn. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var hoopAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .vertical
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        if !hoopAdded {
            let touchLocation = sender.location(in: sceneView)
            let hitTestResult = sceneView.hitTest(touchLocation,
                                                  types: [.existingPlane])
            
            if let result = hitTestResult.first {
                addHoop(result: result)
                hoopAdded = true
            }
        } else {
            createBasketball()
        }
        
    }
    
    func addHoop(result: ARHitTestResult) {
        // Retrieve the scene file and locate the "Hoop" node
        let hoopScene = SCNScene(named: "art.scnassets/hoop.scn")
        
        guard let hoopNode = hoopScene?.rootNode.childNode(withName:
            "Hoop", recursively: false) else {
                return
        }
        
        // Place the node in the correct position
        let planePosition = result.worldTransform.columns.3
        hoopNode.position = SCNVector3(planePosition.x,
                                       planePosition.y, planePosition.z)
        
        //Apply the correct physics body
        hoopNode.physicsBody = SCNPhysicsBody(type: .static, shape:
            SCNPhysicsShape(node: hoopNode, options:
                [SCNPhysicsShape.Option.type :
                    SCNPhysicsShape.ShapeType.concavePolyhedron]))
        
        // Add the node to the scene
        sceneView.scene.rootNode.addChildNode(hoopNode)
        
        
        
        
    }
    
    
    
    
    
    
    func createBasketball() {
        guard let currentFrame = sceneView.session.currentFrame else
        { return }
        
        let ball = SCNNode(geometry: SCNSphere(radius: 0.05))
        ball.geometry?.firstMaterial?.diffuse.contents =
            UIColor.orange
        
        let cameraTransform =
            SCNMatrix4(currentFrame.camera.transform)
        ball.transform = cameraTransform
        
        
        let physicsBody = SCNPhysicsBody(type: .dynamic, shape:
        SCNPhysicsShape(node: ball, options:
            [SCNPhysicsShape.Option.collisionMargin: 0.01]))
        
        ball.physicsBody = physicsBody
        
        let power = Float(10.0)
        let force = SCNVector3(-cameraTransform.m31*power, -cameraTransform.m32*power, -cameraTransform.m33*power)
        
        ball.physicsBody?.applyForce(force, asImpulse: true)
        
        sceneView.scene.rootNode.addChildNode(ball)
    }
    
    
    
    
    
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
