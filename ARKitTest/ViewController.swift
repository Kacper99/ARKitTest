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
    func addBox(){
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0) //The box to add, can make edges rounded as well
        
        let boxNode = SCNNode() //Represents the position and coordinates of an object in 3D space
        boxNode.geometry = box //Set the nodes content to be the box
        boxNode.position = SCNVector3(0,0,-0.2) //Position is relative to the camera, therefore we place it 0.2m infront of us.
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        sceneView.scene = scene
    }
}

