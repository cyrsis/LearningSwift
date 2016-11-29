//
//  NavigationTableViewCell.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.

import UIKit

class NavigationTableViewCell : UITableViewCell {
    class var identifier: String { return String.className(self) }
    
    override internal func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        self.backgroundColor = UIColor(hex: 0x028090)
        self.textLabel?.textColor = UIColor (hex: 0xe8f1f0)
        self.imageView?.tintColor = UIColor (hex: 0xe8f1f0)
        
        if self.highlighted {
            self.backgroundColor = UIColor(hex: 0x004051)
            self.contentView.backgroundColor = UIColor(hex: 0x004051)
        } else {
            self.backgroundColor = UIColor(hex: 0x028090)
            self.contentView.backgroundColor = UIColor(hex: 0x028090)
        }
    }
    
    internal override func setSelected(selected: Bool, animated: Bool) {
        if selected == true {
            self.backgroundColor = UIColor(hex: 0x004051)
            self.contentView.backgroundColor = UIColor(hex: 0x004051)
            self.textLabel?.font = UIFont.boldSystemFontOfSize(18)
        } else {
            self.backgroundColor = UIColor(hex: 0x028090)
            self.contentView.backgroundColor = UIColor(hex: 0x028090)
            self.textLabel?.font = UIFont.systemFontOfSize(18)
        }

    }
}
