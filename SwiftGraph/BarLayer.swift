//
//  BarLayer.swift
//  SwiftGraph
//
//  Created by Michael Peterson on 3/25/15.
//  Copyright (c) 2015 Michael Peterson. All rights reserved.
//

import UIKit

public class BarLayer: CALayer {
    public func CreateLayer(height : CGFloat, width : CGFloat, color : CGColor, location : CGPoint)
    {
        backgroundColor = color
        frame = CGRectMake(location.x, location.y, width, -height)
        shadowOffset = CGSizeMake(0, 3)
        shadowRadius = 5.0
        shadowColor = UIColor.blackColor().CGColor
        shadowOpacity = 0.8
        
    }
}
