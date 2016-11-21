//
//  Computer.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/13/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import Foundation

struct Computer{
	let computerName:String
	let computerMemory:Int64
	let computerFreeMemory:Int64
	let computerUptime:Int64
	let computerType:String
	let computerPlatform:String
	let computerCPUs:[CPU]
}
struct CPU{
	let cpuName:String
	let cpuSpeed:Int64
}
/*"host": "JonsRetina.local",
"totalMemory": 17179869184,
"freeMemory": 2550501376,
"tempDirectory": "/var/folders/87/7cbc3c_d5yvcqr1g9vz3n25r0000gn/T",
"uptime": 1205133,
"type": "Darwin",
"platform": "darwin",
"cpus": [
{
"model": "Intel(R) Core(TM) i7-3720QM CPU @ 2.60GHz",
"speed": 2600,
"times": {
"user": 28446650,
"nice": 0,
"sys": 91900760,
"idle": 1015983600,
"irq": 0
}
},*/


