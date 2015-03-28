//
//  BarGraphScene.swift
//  SwiftGraph
//
//  Created by Michael Peterson on 3/28/15.
//  Copyright (c) 2015 Michael Peterson. All rights reserved.
//

import UIKit
import SceneKit

let sceneView = SCNView()
let myCameraNode = SCNNode()

public class BarGraphScene: SCNScene {
    public override init() {
        super.init()
        let box = SCNBox(width: 5, height: 10, length: 5, chamferRadius: 0.0)
        let color = UIColor.greenColor()
        box.firstMaterial?.diffuse.contents = color
        
        let node = SCNNode(geometry: box)
        node.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
        
        self.rootNode.addChildNode(node)
        
        let boxTwo = SCNBox(width: 5, height: 15, length: 5, chamferRadius: 0.0)
        let colorTwo = UIColor.blueColor()
        boxTwo.firstMaterial?.diffuse.contents = colorTwo
        
        let nodeTwo = SCNNode(geometry: boxTwo)
        nodeTwo.position = SCNVector3(x: 10.0, y: 0.0, z: 0.0)
        
        self.rootNode.addChildNode(nodeTwo)
        
        let camera = self.makeCamera()
        self.rootNode.addChildNode(camera)
    }

    func makeCamera() -> SCNNode {
        let myCamera = SCNCamera()
        myCamera.xFov = 40
        myCamera.yFov = 40
        
        myCameraNode.camera = myCamera
        myCameraNode.position = SCNVector3(x: 25, y: 0, z: 30)
        myCameraNode.orientation = SCNQuaternion(x: 0, y: 0.28, z: 0.0, w: 0.91)
        return myCameraNode
    }
    
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been impletmented")
    }
    
    
}
