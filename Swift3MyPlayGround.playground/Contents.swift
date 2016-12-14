//**Lesson 1 Variable and Types

//有個大叔他叫老鎮，今年34歲
var name = "老鎮"
var age = 34
//明年他就35歲啦
age = 35
//他想改名叫小鎮
//name = "eko"
print(name)


//**Lesson 2 - Assert

var youage = 34
assert(youage>18, "若果你小於18歲就不是大叔了")
var yourage = 34
assert(yourage>18 ,"You are old!!")

//**Lesson 3 -Type Conversation

//辣個人身高1.73m
let height = 1.73
//將height轉為Int型態
let iHeight = Int(height)
//將height轉為Float型態
let fHeight = Float(height)
//將height轉為Double型態
let dHeight = Double(height)


//**Lesson 3

//有個大叔他叫老鎮，年齡34歲，身高1公尺73
let 大叔 = ("老鎮",34,1.73)

//將元群組分解成單獨的常數
let (name2,age2,height2) = 大叔
print("大叔叫：\(name2)")
print("大叔年齡：\(age2) 歲")
print("大叔身高：\(height) 米")

let (_,age2,_) = 大叔
print("大叔的年齡是：\(age2) 歲")

print("大叔叫：\(大叔.0)")
print("大叔年齡：\(大叔.1) 歲")
print("大叔身高：\(大叔.2) 米")

let 大叔2號 = (name:"老鎮",age:34,height:1.73)
print("大叔2號叫：\(大叔2號.name)")
print("大叔2號年齡：\(大叔2號.age) 歲")
print("大叔2號身高：\(大叔2號.height) 米")
