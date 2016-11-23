//
//  VennDiagram.swift
//  VennDiagram
//
//  Created by James Wilson on 12/16/15.
//  Copyright © 2015 Pluralsight. All rights reserved.
//

import UIKit

enum VennWeight {
    case Left
    case Balanced
    case Right
}

class VennDiagram: UIView {

    @IBOutlet weak var leftCircleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftCircleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftCircleBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightCircleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightCircleTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightCircleBottomConstraint: NSLayoutConstraint!
    
    var weight: VennWeight = .Balanced {
        didSet {
            self.setNeedsUpdateConstraints()
        }
    }
    
    override func updateConstraints() {
        
        switch self.weight {
        case .Left:
            self.leftCircleBottomConstraint.constant = 20
            self.leftCircleLeadingConstraint.constant = 20
            self.leftCircleTopConstraint.constant = 20
            
            self.rightCircleBottomConstraint.constant = 40
            self.rightCircleTrailingConstraint.constant = 40
            self.rightCircleTopConstraint.constant = 40
        case .Balanced:
            self.leftCircleBottomConstraint.constant = 20
            self.leftCircleLeadingConstraint.constant = 20
            self.leftCircleTopConstraint.constant = 20
            
            self.rightCircleBottomConstraint.constant = 20
            self.rightCircleTrailingConstraint.constant = 20
            self.rightCircleTopConstraint.constant = 20
        case .Right:
            self.leftCircleBottomConstraint.constant = 40
            self.leftCircleLeadingConstraint.constant = 40
            self.leftCircleTopConstraint.constant = 40
            
            self.rightCircleBottomConstraint.constant = 20
            self.rightCircleTrailingConstraint.constant = 20
            self.rightCircleTopConstraint.constant = 20
        }
        
        super.updateConstraints()
    }
}
