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
if let i = convertsStringInterger(str:strNumber){
i.bigEndian
}else{
  // Check Types conversations
    // Try let strNumber to N123s
  print("number could not be turned into an integer")
}



