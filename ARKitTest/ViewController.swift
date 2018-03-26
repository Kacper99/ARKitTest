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
        // Do any additional setup after loading the view, typically from a nib.
    }

    /**
     Initialize the sceneView session with the world tracking configuration
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration() //Configuration used for world tracking
        sceneView.session.run(configuration) //Session manages motion tracking and image processing from camera. Running it with our configuration
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.pause() //Tell the AR session to stop tracking motion and processing image
    }
}

