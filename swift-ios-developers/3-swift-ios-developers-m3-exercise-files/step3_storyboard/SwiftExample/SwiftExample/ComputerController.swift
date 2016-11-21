//
//  ComputerController.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/13/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import Foundation

typealias ComputerCallback = ([Computer]?,NSError?)->Void

protocol ComputerControllerProtocol {
	func getComputer(ipAddresses:[String], callback:ComputerCallback)-> Void
}

struct MockComputerController : ComputerControllerProtocol{
	func getComputer(ipAddresses:[String],callback:ComputerCallback)->Void{
		var cpus = [CPU]()
		cpus.append(CPU(cpuModel:"Test",cpuSpeed: 2500))
		var computers = [Computer]()
		for  i in 0...ipAddresses.count{
			let computer = Computer(computerName:"Mock Computer \(i)", computerTotalMemory: Int64(42000000), computerFreeMemory:Int64(22000000), computerUpTime:Int64(42),computerType:"Mac", computerPlatform:"darwin",computerCPUs:cpus)
			computers.append(computer)
		}
		callback(computers,nil)
		
		
	}
}