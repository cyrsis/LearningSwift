//
//  CountriesTableViewCell.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.
//

import Foundation
import UIKit

class CountriesTableViewCell : UITableViewCell {
    class var identifier: String { return String.className(self) }
    
    @IBOutlet var countryTitle: UILabel!
    @IBOutlet var countryDescription: UILabel!
    @IBOutlet var countrySpecific: UILabel!
}