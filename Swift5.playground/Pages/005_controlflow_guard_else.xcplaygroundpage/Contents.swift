//: [Previous](@previous)

import Foundation

//: ## 流程控制
//: ### guard...else...使代码的结构和逻辑更加清晰
func myFunc(param:Int) {
    guard param > 0 else {
        return;
    }
    print("param > 0");
}

myFunc(param: 3);

//: #### guard-else...continue...

func printMyNamesContinue(names: [String?]) {
    for i in 0..<names.count {
        guard let myName = names[i] else {
            print("error: name is not found")
            continue
        }
        print(myName)
    }
    print("End of For Loop")
}

//: #### guard-else...break...
func printMyNamesBreak(names: [String?]) {
    for i in 0..<names.count {
        guard let myName = names[i] else {
            print("error: name is not found")
            break
        }
        print(myName)
    }
    print("End of For Loop")
}

//: #### guard-else...throw...
enum ErrosToThrow: Error {
    case nameIsEmpty
}

class Human {
    var name: String?
    init(name:String?) throws {
        guard let name = name else {
            throw ErrosToThrow.nameIsEmpty
        }
        self.name = name
    }
}

do {
    _ = try? Human(name: nil)
} catch ErrosToThrow.nameIsEmpty {
    print("The name is empry, cannot initialize human")
}
//

//: [Next](@next)
