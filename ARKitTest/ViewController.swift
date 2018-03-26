//
//  ViewController.swift
//  ARKitTest
//
//  Created by Kacper Martela on 26/03/2018.
//  Copyright © 2018 Kacper Martela. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBox()
        addTapGestureToSceneView()
    }

    /**
     Initialize the sceneView session with the world tracking configuration
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration() //Configuration used for world tracking
        sceneView.session.run(configuration) //Session manages motion tracking and image processing from camera. Running it with our configuration
    }
    
    /**
    Tells the AR session to stop/pause
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.pause() //Tell the AR session to stop tracking motion and processing image
    }
    
    /**
    Used to add a box into the enviroment
    */
    func addBox(x: Float = 0, y: Float = 0, z: Float = -0.2){
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0) //The box to add, can make edges rounded as well
        
        let boxNode = SCNNode() //Represents the position and coordinates of an object in 3D space
        boxNode.geometry = box //Set the nodes content to be the box
        boxNode.position = SCNVector3(x,y,z) //Position is relative to the camera, therefore we place it 0.2m infront of us.
        
        sceneView.scene.rootNode.addChildNode(boxNode)
    }
    
    /**
     Removes a box from the scene
     */
    @objc func didTap(withGestureRecognizer recognizer: UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: sceneView) //Retrieve the users tap location relative to the sceneView
        let hitTestResults = sceneView.hitTest(tapLocation) //See if we tapped any nodes
        guard let node = hitTestResults.first?.node else {return} //Unwrap first node from hit test and if the first result doesnt contain atleast one node remove the first node tapped from it's parent node
        node.removeFromParentNode()
        
    }
    
    /**
     Add a tap gesture recogniser to the scene view
    */
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap(withGestureRecognizer:))) //Initialize a tap gesture recognizer with the target set to the view controller and action selector to didTap
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
}

/**
 Transforms a matrix into a float 3
 - Returns: The matrix as a float3
 */
extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}

