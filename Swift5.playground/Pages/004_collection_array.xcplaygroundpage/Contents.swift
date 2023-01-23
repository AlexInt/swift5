//: [Previous](@previous)

import Foundation

/*:
 ## 集合之数组
 Swift语言中Array采用结构体来实现
 */

//: ### 创建空数组
// Int型数组， 声明数组
var array1: [Int];
var array2: Array<Int>;
// 赋值
array1 = [];
array2 = Array();
array1 = [1, 2, 3];
array2 = Array(arrayLiteral: 1, 2, 3);

//: ### 创建大量相同元素的数组
//创建有10个String类型元素的数组，并且每个元素都为字符串"Hello"
var array3 = [String](repeating: "Hello", count: 10);
//创建有10个Int类型元素的数组，且每个元素都为1
var array4 = Array(repeating: 1, count: 10);

//: ### 数组相加
var array5 = [1, 2, 3] + [4, 5, 6];

//: ### 获取数组信息及增删改查（array为变量才可以增删改）

//: #### 获取数组中元素的个数
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
array.count   //9
//: #### 检查数组是否为空数组
if array.isEmpty {
    print("array 为空数组");
}
//: #### 通过下标获取数组中的元素
var a = array[0];
//: #### 获取区间元素组成的新数组
var subArray = array[0...3] //[1, 2, 3, 4]
//: #### 获取数组的第一个元素
var b = array.first;
//: #### 获取数组的最后一个元素
var c = array.last;
//: #### 修改数组中某个位置的元素
array[0] = 0;
//: #### 修改数组中区间范围的元素
array[0...3] = [1, 2, 3, 4];
//: #### 向数组中追加一个元素
array.append(10);
//: #### 向数组中追加一组元素
array.append(contentsOf: [11, 12, 13]);
//: #### 向数组中的某个位置插入一个元素
array.insert(0, at: 0);
//: #### 向数组中的某个位置插入一组元素
array.insert(contentsOf: [-2, -1], at: 0);
//: #### 移除数组中某个位置的元素
array.remove(at: 1);
//: #### 移除数组中首个位置的元素
array.removeFirst();
//: #### 移除数组中最后一个位置的元素
array.removeLast();
//: #### 移除前几位元素， 参数为要移除元素的个数
array.removeFirst(2);
//: #### 移除后几位元素，参数为要移除元素的个数
array.removeLast(2);
//: #### 移除一个范围内的元素
array.removeSubrange(0...2);
//: #### 替换一个范围内的元素
array.replaceSubrange(0...2, with: [0,1]);
//: #### 移除所有元素
array.removeAll()
//: #### 判断数组中是否包含某个元素
if array.contains(1) {
    print(true);
}

//: ### for-in遍历
//Int型数组
let arrayLet = [0,1,2,3,4];
//(Int,Int)型数组
let arrayLet2 = [(1,2), (2,3),(3,4)];
//: #### 直接遍历数组
for item in arrayLet {
    print(item);
}
//: #### 进行数组枚举遍历
for item in arrayLet.enumerated() {
    print("enum --> \(item)")
}
//: #### 进行数组角标遍历
for index in arrayLet2.indices {
    print(arrayLet2[index], separator: "");
}
let sa = [1, 3, 5, 7]
for idx in sa.indices {
    print("\(idx)---\(sa[idx])")
}
//: ### 数组排序
var arraySort = [1, 3, 5, 6, 7];
//从大到小排序
arraySort = arraySort.sorted(by: >);
//从小到大排序
arraySort = arraySort.sorted(by: <);

//获取数组中的最大值
arraySort.max()
//获取数组中的最小值
arraySort.min()

//: ### zip

let wizards = ["Harry", "Ron", "Hermione", "Draco"]
let animals = ["Hedwig", "Scabbers", "Crookshanks"]
let combined = Array(zip(wizards, animals))
//print(combined)
//[("Harry", "Hedwig"), ("Ron", "Scabbers"), ("Hermione", "Crookshanks")]

for (wizard, animal) in zip(wizards, animals) {
    print("\(wizard) has \(animal)")
}

//: ### reduce
let numbers = [1, 12, 2, 9, 27]
let total = numbers.reduce(0, +)

//: [Next](@next)
