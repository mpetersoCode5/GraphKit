//
//  BarGraphView.swift
//  SwiftGraph
//
//  Created by Michael Peterson on 3/29/15.
//  Copyright (c) 2015 Michael Peterson. All rights reserved.
//

import UIKit
import SceneKit

public class BarGraphView: SCNView {

    public func setupView(values : NSArray, colors : NSArray, max : CGFloat)
    {
        let bScene = BarGraphScene()
        
        frame = CGRectMake(30, 50, 320, 300)
        autoresizingMask = UIViewAutoresizing.allZeros
        
        bScene.setupGraph(values, colors: colors, max: max)
        
        scene = bScene
        autoenablesDefaultLighting = true
        allowsCameraControl = true
        backgroundColor = UIColor.blackColor()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
