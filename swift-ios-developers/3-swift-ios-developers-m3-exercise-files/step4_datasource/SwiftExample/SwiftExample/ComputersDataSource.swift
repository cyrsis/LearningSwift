//
//  ComputersDataSource.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/13/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import UIKit
private let cellID = "computerCell"
class ComputersDataSource: NSObject , UICollectionViewDataSource{
	var computers:[Computer]?{
		didSet{
			self.reloadData()
		}
	}
	func reloadData()
	{
		self.collectionView.reloadData()
	}
	@IBOutlet private weak var collectionView:UICollectionView!
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath)
		//fill cell with data
		return cell
	}
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		var ret = 0
		if let c = self.computers{
			ret = c.count
		}
		
		return ret
		
	}
	

}
