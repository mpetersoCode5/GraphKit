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
    var colorValues = NSMutableArray()
    var barLayers = NSMutableArray()
    var textArray = NSMutableArray()
    var barWidth = 75 as CGFloat
    var barDistance = 100 as CGFloat
    var barCount = 2
    var graphMax = 3000 as CGFloat
    
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
        
        graphMax = max
        barCount = values.count
        DetermineBarWidth()
        
        var count = 0
        var xValue = 0.0 as CGFloat
        for value in values
        {
            colorValues.addObject(colors.objectAtIndex(count))
            var actualValue = value as CGFloat
            var barLayer = BarLayer()
            barLayer.CreateLayer((pixelValues.objectAtIndex(count) as CGFloat), width : barWidth,  color: (colors.objectAtIndex(count) as CGColor), location: CGPoint(x: xValue, y: frame.height))
            barLayers.addObject(barLayer)
            
            var label = CATextLayer()
            label.font = "Helvetica-Bold"
            label.fontSize = 12
            label.frame = CGRect(x: (xValue - 10) + (barLayer.frame.width / 2 - 15), y: (frame.height - (pixelValues.objectAtIndex(count) as CGFloat) - 20), width: 50, height: 20)
            var intPercentage = Int(actualValue)
            label.string = NSString(format: "%d", intPercentage)
            label.alignmentMode = kCAAlignmentCenter
            label.foregroundColor = UIColor.blackColor().CGColor
            textArray.addObject(label)
            xValue += barDistance
            count++
        }
        setNeedsDisplay()
    }
    
    public func UpdateValues(newValues : NSArray)
    {
        var count = 0
        var xValue = 0.0 as CGFloat
        for value in newValues
        {
            var actualValue = value as CGFloat
            var pixelValue = DetermineHeight(actualValue, max: graphMax)
            var bValue = value as CGFloat
            var barLayer = (barLayers.objectAtIndex(count) as BarLayer)
            barLayer.CreateLayer(pixelValue, width : barWidth,  color: (colorValues.objectAtIndex(count) as CGColor), location: CGPoint(x: xValue, y: frame.height))
            var label = textArray.objectAtIndex(count) as CATextLayer
            label.font = "Helvetica-Bold"
            label.fontSize = 12
            label.frame = CGRect(x: (xValue - 10) + (barLayer.frame.width / 2 - 15), y: (frame.height - pixelValue) as CGFloat - 20, width: 50, height: 20)
            var intPercentage = Int(actualValue)
            label.string = NSString(format: "%d", intPercentage)
            label.alignmentMode = kCAAlignmentCenter
            label.foregroundColor = UIColor.blackColor().CGColor
            xValue += barDistance
            count++
        }
        setNeedsDisplay()
    }
    
    public func DetermineBarWidth()
    {
        switch(barCount)
        {
        case 1:
            barWidth = 150
            barDistance = 0
            break
        case 2:
            barWidth = 150
            barDistance = 175
            break
        case 3:
            barWidth = 100
            barDistance = 115
            break
        case 4:
            barWidth = 75
            barDistance = 90
            break
        case 5:
            barWidth = 60
            barDistance = 75
            break
        case 6:
            barWidth = 50
            barDistance = 60
            break
        case 7:
            barWidth = 40
            barDistance = 50
            break
        default:
            barWidth = 10
            barDistance = 15
            break
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func drawRect(rect: CGRect) {
        if let lay = self.layer.sublayers
        {
            self.layer.sublayers.removeAll(keepCapacity: false)
        }
        
        var maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.backgroundColor = UIColor.whiteColor().CGColor
        maskLayer.opacity = 0.0;
        self.layer.addSublayer(maskLayer)
        
        var count = 0
        
        for temp in barLayers
        {
            var bLayer = temp as BarLayer
            self.layer.addSublayer(bLayer)
        }
        
        for temp in textArray
        {
            var bLayer = temp as CATextLayer
            self.layer.addSublayer(bLayer)
        }
    }


}
