//
//  BarGraph.swift
//  SwiftGraph
//
//  Created by Michael Peterson on 3/25/15.
//  Copyright (c) 2015 Michael Peterson. All rights reserved.
//

import UIKit

public class BarGraph: UIView {

    var pixelValues = NSMutableArray()
    var barLayers = NSMutableArray()
    var textArray = NSMutableArray()
    
    public func DetermineHeight(value : CGFloat, max : CGFloat) -> CGFloat
    {
        var pixels = (value * frame.height) as CGFloat
        pixels /= max
        return pixels
    }
    
    public func CreateBarGraph(values : NSArray, colors : NSArray, max : CGFloat, min : CGFloat)
    {
        for value in values
        {
            var actualValue = value as CGFloat
            var pixelValue = DetermineHeight(actualValue, max: max)
            pixelValues.addObject(pixelValue)
        }
        
        var count = 0
        var xValue = 0.0 as CGFloat
        for value in values
        {
            var actualValue = value as CGFloat
            var barLayer = BarLayer()
            barLayer.CreateLayer((pixelValues.objectAtIndex(count) as CGFloat), color: (colors.objectAtIndex(count) as CGColor), location: CGPoint(x: xValue, y: frame.height))
            barLayers.addObject(barLayer)
            xValue += 100.0
            count++
            var label = CATextLayer()
            label.font = "Helvetica-Bold"
            label.fontSize = 12
            label.frame = CGRect(x: xValue, y: (frame.height - (pixelValues.objectAtIndex(count) as CGFloat) - 20), width: 50, height: 20)
            var intPercentage = Int(actualValue)
            label.string = NSString(format: "%d", intPercentage)
            label.alignmentMode = kCAAlignmentCenter
            label.foregroundColor = UIColor.whiteColor().CGColor
            textArray.addObject(label)
            
        }
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func drawRect(rect: CGRect) {
        // Drawing code
    }


}