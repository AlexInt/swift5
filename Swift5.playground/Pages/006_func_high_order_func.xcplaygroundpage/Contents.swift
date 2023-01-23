//: [Previous](@previous)

import Foundation

//: ## 高阶函数
/*:
 ### map
   可以对数组中的每一个元素做一次处理
 */
// 计算字符串的长度
let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
func stringCount(string: String) -> Int {
    return string.count
}
stringArray.map(stringCount)

stringArray.map({string -> Int in
    return string.count
})

// $0代表数组中的每一个元素
stringArray.map{
    return $0.count
}

let arr = stringArray.map{$0.count}
print(arr)

/*:
 ### compactMap与map的区别
 */
let array = ["Apple", "Orange", "Puple", ""]

let arr1 = array.map { a -> Int? in
    let length = a.count
    guard length > 0 else { return nil }
    return length
}
arr1 // [{some 5}, {some 6}, {some 5}, nil]

//: > `compactMap`返回后的数组中不存在`nil`, 同时它会把Optional解包
let arr2 = array.compactMap { a-> Int? in
    let length = a.count
    guard length > 0 else { return nil}
    return length
}
arr2 // [5, 6, 5]

//筛选数据 - 能被4整除的数
let nums = [12, 55, 733, 77, 44]
let result = nums.compactMap { (item) -> Int? in
    if item % 4 == 0 {
        return item
    }
    return nil
}
print(result) // [12, 44]

//: ### filter
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let odd = numbers.filter { (number) -> Bool in
    return number % 2 == 1
}
print(odd) // [1, 3, 5, 7, 9]

//: ### map 转换
let maps = odd.map { (number) -> String in
    return "\(number)"
}
print(maps) // ["1", "3", "5", "7", "9"]

//: ### reduce 累计运算
let resultReduce = odd.reduce(0, +)
print(result) // 25

//: ### flatMap 1.数组展开
let numberList = [[1, 2, 3], [4, 5], [[6]]]
let flatMapNumber = numberList.flatMap { (value) in
    return value
}
print(flatMapNumber) // [1, 2, 3, 4, 5, [6]]

//: ### flatMap 2.过滤数组中的nil 被弃用
let country = ["cn", "us", nil, "en"]
//let flatMap = country.flatMap { (value) in
//    return value
//}
//print(flatMap) //["cn", "us", "en"]

//: ### compactMap 过滤数组中的nil
let compactMap = country.compactMap { (value) in
    return value
}
print(compactMap) // ["cn", "us", "en"]


//: [Next](@next)
