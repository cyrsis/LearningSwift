//
//  ComputerDataSource.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/13/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import UIKit
private let cellId = "ComputerCellId"
class ComputerDataSource: NSObject , UICollectionViewDataSource {
	var computers:[Computer]?{
		didSet{
			self.reload()
		}
	}
	func reload(){
		self.collectionView.reloadData()
	}
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
		if let comps = self.computers{
			let computer = comps[indexPath.row]
			if let ccell = cell as? ComputerCollectionViewCell{
				//ccell.computerNameLabel.text = computer.computerName
				ccell.computer = computer
			}
		}
		
		return cell
	}
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		var ret = 0
		if let comps = self.computers{
			ret = comps.count
		}
		
		return ret
	}
	@IBOutlet private weak var collectionView:UICollectionView!
	
}
