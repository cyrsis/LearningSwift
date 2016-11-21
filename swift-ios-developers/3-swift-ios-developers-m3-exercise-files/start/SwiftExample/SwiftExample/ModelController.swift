//
//  ModelController.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/13/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import Foundation

typealias ComputersCallback = ([Computer]?,NSError?)->Void
protocol ComputerModelController{
	func getComputers(ipAddresses:[String],callback:ComputersCallback)->Void
}
struct MockModelController : ComputerModelController{
	func getComputers(ipAddresses:[String],callback:ComputersCallback)->Void{
		var computers = [Computer]()
		for i in 0...ipAddresses.count{
			var cpus = [CPU]()
			cpus.append(CPU(cpuName:"Fake CPU",cpuSpeed: 42))
			let computer = Computer(computerName:" Computer \(i)",computerMemory:4200000
			, computerFreeMemory:200000
			, computerUptime:42
			, computerType:"Mock"
			, computerPlatform:"Mock Platform"
			, computerCPUs:cpus)
			computers.append(computer)
		}
		callback(computers, nil)
	}
}






