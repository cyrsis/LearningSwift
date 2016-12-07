
let names = ["Scott", "Lori", "Charlotte", "Betty", "Stella", "Isabella", "Lilith"]

let namesBeginningWithS = names.filter({ (name: String) -> Bool in
    return name.lowercased().characters.first! == "s"
})

let namesIncludingAnE = names.filter {
    return $0.lowercased().characters.contains("e")
}

names.sorted(by: >)

print(names)

let nestedArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

let flattendArray = nestedArray.flatMap { $0 }

print(flattendArray)

import Foundation

let randomName: String = {
    let randomIndex = Int(arc4random_uniform(UInt32(names.count)))
    return names[randomIndex]
}()
