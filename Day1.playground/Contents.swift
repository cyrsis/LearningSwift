//: Playground - noun: a place where people can play



//# for object c
import UIKit


//Optional -> What is optional?
//String to Int

var str = "Hello, playground"

let strNumber = "123"
func convertsStringInterger(str:String)->Int?{ //Can be a global function

return Int(str)
}

let i = convertsStringInterger(str:strNumber)