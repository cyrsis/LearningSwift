//
//  CircleView.swift
//  VennDiagram
//
//  Created by James Wilson on 12/16/15.
//  Copyright © 2015 Pluralsight. All rights reserved.
//

import UIKit

@IBDesignable
public class CircleView: UIView {
    
    @IBInspectable
    public var fillColor: UIColor {
        didSet {
            self.layoutSubviews()
            self.layoutIfNeeded()
        }
    }
    
    public override init(frame: CGRect) {
        self.fillColor = UIColor.lightTextColor()
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.fillColor = UIColor.lightTextColor()
        
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    
    
    public var shapeLayer: CAShapeLayer {
        get {
            return self.layer as! CAShapeLayer
        }
    }
    
    public override class func layerClass() -> AnyClass {
        return CAShapeLayer.self
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let bezierPath = UIBezierPath(ovalInRect: self.bounds)

        self.shapeLayer.fillColor = self.fillColor.CGColor
        self.shapeLayer.path = bezierPath.CGPath
    }
    
    
}
