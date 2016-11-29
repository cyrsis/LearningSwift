//
//  DataHelperProtocol.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.
//

import Foundation
import SQLite

/**
 This are default methods that needs to be created, you can modify this if you want.
 */
protocol DataHelperProtocol {
    associatedtype T
    static func createTable() throws -> Void
    static func insert(item: T) -> Bool
    static func update(item: T) -> Bool
    static func delete(item: T) -> Bool
    static func populateObject(item:Row) -> T?
}