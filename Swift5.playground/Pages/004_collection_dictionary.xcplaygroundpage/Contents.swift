//: [Previous](@previous)

import Foundation

/*:
 ## 集合之字典
 */
//: ### 字典的创建与赋值
// 声明字典
var dic1: [Int:String]
var dic2: Dictionary<Int, String>
// 字典的赋值
dic1 = [1:"1", 2:"2", 3:"3"];
dic2 = Dictionary(dictionaryLiteral: (1, "1"), (2, "2"), (3, "3"));
//: > 创建字典可以不显示声明其类型，采用自动推导
var dic3 = ["1": "one"];

//: #### 创建空字典
var dic4: [Int:Int] = [:];
var dic5: Dictionary<Int, Int> = Dictionary();

/*: > 字典需要通过键找到相应的值，所以值可以重复，键必须唯一*/
//: #### 获取字典中的元素个数
dic1.count
//: #### 判断字典是否为空
if dic4.isEmpty {
    print("字典为空");
}

//: #### 通过具体键操作值
//获取值
dic1[2]
//修改值
dic1[1] = "0";
//添加一对新的键值
dic1[4] = "4";
/*:
 > * 在对某个键进行赋值时，如果这个键存在，就会进行值的更新；
 > * 如果这个键不存在，就添加一对新的键值
 */
dic1.updateValue("1", forKey: 1)
//使用if let处理updateValue的返回值
if let oldValue = dic1.updateValue("one", forKey: 1) {
    print("Old Value is \(oldValue)");
}
/*:
 > * 对键值进行更新，如果键存在就更新并返回旧值的Optional，如果键不存在也不添加新键值对，而是返回`nil`
 */
if let value = dic2[1] {
    print("The value is \(value)");
}
//: > 通过键获取的数据也将返回Optional类型的值，也使用`if let`

//: #### 通过键删除某个键值对
dic1.removeValue(forKey: 1);
//: #### 删除所有键值对
dic1.removeAll();

//: ### 字典遍历
//: #### 通过键来遍历字典
for item in dic2.keys {
    print(item);
}
//: #### 通过值来遍历字典
for item in dic2.values {
    print(item)
}
//: #### 直接遍历字典
for item in dic2 {
    print(item)
}
for (key,value) in dic2 {
    print("\(key):\(value)");
}

//: #### 遍历时对其进行排序后遍历
for item in dic2.keys.sorted(by: >) {
    print(dic2[item])
}

//: [Next](@next)
