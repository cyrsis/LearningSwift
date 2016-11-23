//
//  Recipe.swift
//  Recipe1
//
//  Created by Brett Romero on 4/13/15.
//  Copyright (c) 2015 Brett Romero. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    var title: String?
    var content: String?
    
    init (title: String, content: String){
        self.title = title
        self.content = content
    }
    
    override init() {
        super.init()
    }
}
