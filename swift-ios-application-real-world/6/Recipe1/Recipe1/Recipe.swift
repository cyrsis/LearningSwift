//
//  Recipe.swift
//  Recipe1
//
//  Created by Brett Romero on 4/13/15.
//  Copyright (c) 2015 Brett Romero. All rights reserved.
//

import UIKit

class Recipe: NSObject, NSCoding {
    var title: String?
    var content: String?
    
    init (title: String, content: String){
        self.title = title
        self.content = content
    }
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder){
        if let titleDecoded = aDecoder.decodeObjectForKey("title") as? String {
            title = titleDecoded
        }
        
        if let contentDecoded = aDecoder.decodeObjectForKey("content") as? String {
            content = contentDecoded
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let titleEncoded = title {
            aCoder.encodeObject(titleEncoded, forKey:"title")
        }
        
        if let contentEncoded = content {
            aCoder.encodeObject(contentEncoded, forKey:"content")
        }
    }
}
