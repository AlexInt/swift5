//: [Previous](@previous)

import Foundation

/*:
 # Set
 ## 集合类型的哈希性
 
 一个类型为了存储在集合中，该类型必须是可哈希化的——也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是 Int 类型的，相等的对象哈希值必须相同，比如 a == b,因此必须 `a.hashValue == b.hashValue`。
 
 Swift 的所有基本类型（比如 `String`、`Int`、`Double` 和 `Bool`）默认都是可哈希化的，可以作为集合值的类型或者字典键的类型。没有关联值的枚举成员值默认也是可哈希化的。
 */

/*:
 Set 一个无序的集合，其中的元素不可以重复
 */
/*:
 ### 创建和构造一个空的集合
 
 Swift 中的集合类型被写为 `Set<Element>`，这里的 Element 表示集合中允许存储的类型。和数组不同的是，集合没有等价的简化形式。
 */

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印“letters is of type Set<Character> with 0 items.”


/*:
 ### 用数组字面量创建集合
 */
var set1: Set<Int> = [1, 2, 3, 4];
var set2 = Set(arrayLiteral: 1, 2, 3, 4);

/*:
### 虽然Set不关注元素的顺序，但是仍然支持通过下标取值
 */
//: #### 获取Set首个元素，(顺序不定)
set1[set1.startIndex];
//:>进行下标的移动（下标操作为不可逆操作，只能向后移动，不能向前移动）
//: #### 获取某个下标后一位元素
set1[set1.index(after: set1.startIndex)];
//: #### 获取某个下标后几位的元素
set1[set1.index(set1.startIndex, offsetBy: 3)];

//: ### 获取元素个数
set1.count
//: #### 判断集合是否为空集合
if set1.isEmpty {
    print("集合为空");
}
//: #### 判断集合中是否包含某个元素
if set1.contains(1) {
    print("集合包含1");
}
//: #### 获取集合中的最大值
set1.max();
//: #### 获取集合中的最小值
set1.min();

/*:
 ### 变量支持增删改查
 */
//: #### 向集合中插入一个元素
set1.insert(5);
//: #### 移除集合中的某个元素
set1.remove(1);
//: #### 移除集合中的第一个元素
set1.removeFirst();
//: #### 移除集合中某个位置的元素
set1.remove(at: set1.index(set1.startIndex, offsetBy: 2));
//: #### 移除集合中所有的元素
set1.removeAll()

/*:
 ### 交集运算，并集运算、补集运算
 
 Set集合类型与Array数组类型除了有序和无序的区别外，还有：Set集合可以进行数学运算，
 例如：交集运算，并集运算、补集运算等
 */
var set3: Set<Int> = [1, 2, 3, 4]
var set4: Set<Int> = [1, 2, 5, 6]
//返回交集{1, 2}
var setInter = set3.intersection(set4);

//返回交集的补集{4, 5, 6, 3}
var setEx = set3.symmetricDifference(set4);

//返回并集{4, 5, 6, 1, 3, 2}
var setUni = set3.union(set4);

//返回第二个集合的补集{4, 3}
var setSub = set3.subtracting(set4);

/*: ### 集合相等比较*/
var set5: Set = [1, 2];
var set6: Set = [2, 3];
var set7: Set = [1, 2, 3];
var set8: Set = [1, 2, 3];
//: #### 判断是否是某个集合的子集
//set5是set7的子集 返回true
set5.isSubset(of: set7);
//: #### 判断是否是某个集合的超集
set7.isSuperset(of: set5);
//: #### 判断是否是某个集合的真子集
set5.isStrictSubset(of: set7);
//: #### 判断是否是某个集合的真超集
set7.isSuperset(of: set8);

/*:
 ### for-in遍历
 */
//: #### 遍历元素
for item in set7 {
    print(item);
}
//: #### 遍历集合的枚举
for item in set7.enumerated() {
    print("set enum --> \(item)");
}
//: #### 遍历集合的下标
for index in set7.indices {
    print(set7[index]);
}
/*:
 > 集合虽然不强调元素顺序，但是在遍历时，可以对其排序后遍历
 */
for item in set7.sorted(by: >) {
    print("sorted \(item)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

//: 使用`union(_:)`方法根据两个集合的所有值创建一个新的集合。
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

//: 使用`intersection(_:)`方法根据两个集合的交集创建一个新的集合
oddDigits.intersection(evenDigits).sorted()
// []

//: 使用`subtracting(_:)`方法根据不在另一个集合中的值创建一个新的集合。
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

//:使用`symmetricDifference(_:)`方法根据两个集合不相交的值创建一个新的集合。
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]



let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

//: 使用`isSubset(of:)`方法来判断一个集合中的所有值是否也被包含在另外一个集合中
houseAnimals.isSubset(of: farmAnimals)
// true

//:使用`isSuperset(of:)`方法来判断一个集合是否包含另一个集合中所有的值。
farmAnimals.isSuperset(of: houseAnimals)
// true


//:使用`isDisjoint(with:)`方法来判断两个集合是否不含有相同的值（是否没有交集）
farmAnimals.isDisjoint(with: cityAnimals)
// true

//: [Next](@next)
