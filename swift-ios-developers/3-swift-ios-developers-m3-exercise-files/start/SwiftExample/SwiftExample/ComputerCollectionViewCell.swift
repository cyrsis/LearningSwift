//
//  ComputerCollectionViewCell.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/13/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import UIKit

class ComputerCollectionViewCell: UICollectionViewCell {
	var computer:Computer?{
		didSet{
			self.loadDataIntoUI()
		}
	}
	func loadDataIntoUI(){
		if let c = self.computer{
			self.computerNameLabel.text = c.computerName
		}
	}
	@IBOutlet private weak var computerNameLabel:UILabel!
}
