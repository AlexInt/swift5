//: [Previous](@previous)

import Foundation

/*:
 ## 结构体 struct
 */
struct Car {
    var price: Int
    var brand: String
    var petrol: Int
    
    mutating func drive(){
        if petrol>0 {
            petrol -= 1
            print("drive 10 milo");
        }
    }
    
    mutating func addPetrol() {
        petrol += 10;
        print("add 10 unit fuel");
    }
}

/*:
 * Swift语言中的数据类型分为值类型和引用类型。
 * 结构体、枚举及除类以外的所有数据类型都属于值类型，只有类是引用类型。
 * 值类型与引用类型的区别在于：当进行数据传递时，值类型总是被复制，而引用类型不会被复制，引用类型是通过引用计数来管理其生命周期的。
 * 如果将类实例传递给了新的变量，修改新的变量会影响到原始变量。
 * 如果要对值类型进行比较操作，应使用等于运算符`==`,对引用类型进行比较操作应使用等同于运算符`===`
 */


//: [Next](@next)
