//
//  ComputerCollectionViewCell.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/13/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import UIKit

class ComputerCollectionViewCell: UICollectionViewCell {
	@IBOutlet private weak var computerNameLabel:UILabel!
	var computer:Computer?{
		didSet{
				self.reloadData()
		}
	}
	func reloadData(){
		if let c  = self.computer{
			self.computerNameLabel.text = c.computerName
		}
	}
}
