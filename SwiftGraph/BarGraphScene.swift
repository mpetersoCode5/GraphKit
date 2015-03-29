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
let nodeArray = NSMutableArray()

public class BarGraphScene: SCNScene {
    public override init() {
        super.init()

    }

    public func setupGraph(values : NSArray, colors : NSArray, max : CGFloat)
    {
        var zValue = Float(60)//Float(max * 3)
        var count = 0;
        var xValue = 15.0 as Float
        var ratio = 1.0 as CGFloat
        
        if(max >= 40.0)
        {
            ratio = (max/40.0) as CGFloat
        }
        
        xValue -= (Float(values.count-1) * 5.0)
        
        var smallestValue = 0.0 as CGFloat
        
        for temp in values
        {
            var value = temp as CGFloat
            value /= ratio
            if(smallestValue == 0.0)
            {
                smallestValue = value
            } else if(value < smallestValue)
            {
                smallestValue = value
            }
        }
        
        for temp in values
        {
            var value = temp as CGFloat
            value /= ratio
            var difference = value - smallestValue
            
            let box = SCNBox(width: 5, height: value, length: 5, chamferRadius: 0.05)
            var color = colors.objectAtIndex(count) as UIColor
            box.firstMaterial?.diffuse.contents = color
            
            let node = SCNNode(geometry: box)
            node.position = SCNVector3(x: xValue, y: (Float(difference/2) - 15), z: 0.0)
            
            nodeArray.addObject(node)
            self.rootNode.addChildNode(node)
            
            xValue += 10.0
            count++
        }
        
        let camera = self.makeCamera(zValue)
        self.rootNode.addChildNode(camera)
        
    }
    
    func makeCamera(zValue : Float) -> SCNNode {
        let myCamera = SCNCamera()
        myCamera.xFov = 40
        myCamera.yFov = 40
        
        myCameraNode.camera = myCamera
        myCameraNode.position = SCNVector3(x: 55, y: 0, z: zValue)
        myCameraNode.orientation = SCNQuaternion(x: 0, y: 0.28, z: 0.0, w: 0.91)
        return myCameraNode
    }
    
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been impletmented")
    }
    
    
}
