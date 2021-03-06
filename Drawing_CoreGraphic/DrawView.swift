//
//  DrawView.swift
//  Drawing_CoreGraphic
//
//  Created by Vincent Narbot on 7/21/15.
//  Copyright (c) 2015 Vincent Narbot. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines: [Line] = []
    var startPoint: CGPoint!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.blackColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            startPoint = touch.locationInView(self)
        }
        
        super.touchesBegan(touches , withEvent:event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let endPoint = touch.locationInView(self)
            lines.append(Line(start: startPoint, end: endPoint))
            startPoint = endPoint
        }
        super.touchesBegan(touches , withEvent:event)
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetRGBStrokeColor(context, 1, 1, 1, 1)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
    }
    
}
