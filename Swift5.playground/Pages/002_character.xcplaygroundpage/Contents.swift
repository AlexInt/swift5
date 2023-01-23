//: [Previous](@previous)

import Foundation

/*:
 ## 字符 Character
 */
let char1: Character = "\n"

let ls:[Character] = ["l", "i", "n", "e"]

var line2 = String(ls)
line2.append(char1)

print(#"6 times 7 is \#(6 * 7)."#)
// 打印 "6 times 7 is 42."

let greeting = "Guten Tag!"
// G //第一个字符
greeting[greeting.startIndex]
// ! //最后一个字符
greeting[greeting.index(before: greeting.endIndex)]
// u 第二字符的索引
greeting[greeting.index(after: greeting.startIndex)]
//第七个字符的索引
let index = greeting.index(greeting.startIndex, offsetBy: 7)
// a
greeting[index]


for index in greeting.indices {
   print("\(greeting[index]) ", terminator: "")
}
// 打印输出“G u t e n   T a g ! ”

/*:
 ### 字符操作
 */

//: #### 创建一个字符
var e: Character = "a";
//: #### 创建字符数组
var e2: [Character] = ["H", "E", "L", "L", "O"];
//: #### 通过字符数组来构造字符串
var e3 = String(e2); //"HELLO"

//: #### 通过构造方法来创建字符类型变量
var e4 = Character("a");

//: #### 使用`for-in`遍历将字符串中字符拆解出来
let name = "China";
for char in name {
    print(char);
}

/*:
 ### 字符类型
 */
MemoryLayout<String>.size  //16
MemoryLayout<Character>.size //16
MemoryLayout<Int>.size//8
MemoryLayout<Double>.size//8
MemoryLayout<Float>.size//4
MemoryLayout<Bool>.size //1


//: ## Unicode
/*:
 Unicode是一个用于在不同书写系统中对文本进行编码、表示和处理的国际标准。它使你可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。Swift 的 String 和 Character 类型是完全兼容 Unicode 标准的。
 */

/*:
 ### Unicode 标量 - Unicode Scalar Values
 
 Swift 的 String 类型是基于 Unicode 标量 建立的。Unicode 标量是对应字符或者修饰符的唯一的 21 位数字，例如 `U+0061` 表示小写的拉丁字母（LATIN SMALL LETTER A）（"a"），`U+1F425` 表示小鸡表情（FRONT-FACING BABY CHICK）（"🐥"）。
 
 > 并非所有 21 位 Unicode 标量值都分配给字符，某些标量被保留用于将来分配或用于 UTF-16 编码。已分配的标量值通常也有一个名称，例如上面示例中的 LATIN SMALL LETTER A 和 FRONT-FACING BABY CHICK。
 */

/*:
 ### 可扩展的字形群集 - Extended Grapheme Clusters
 
 每一个 Swift 的 Character 类型代表一个可扩展的字形群。而一个可扩展的字形群构成了人类可读的单个字符，它由一个或多个（当组合时） Unicode 标量的序列组成。
 
 举个例子，字母 `é` 可以用单一的 Unicode 标量 `é`(LATIN SMALL LETTER E WITH ACUTE, 或者 `U+00E9`)来表示。然而一个标准的字母 `e`(LATIN SMALL LETTER E 或者 `U+0065`) 加上一个急促重音（COMBINING ACTUE ACCENT）的标量（`U+0301`），这样一对标量就表示了同样的字母 `é`。 这个急促重音的标量形象的将 `e` 转换成了 `é`。
 
 在这两种情况中，字母 `é` 代表了一个单一的 Swift 的 Character 值，同时代表了一个可扩展的字形群。在第一种情况，这个字形群包含一个单一标量；而在第二种情况，它是包含两个标量的字形群：
 
 */

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上
// eAcute 是 é, combinedEAcute 是 é
let eStr1 = String(eAcute)
let eStr2 = String(combinedEAcute)
print("\(eStr1.count) -- \(eStr2.count)") //1 -- 1

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed 是 한, decomposed 是 한


var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// 打印输出“the number of characters in cafe is 4”

word += "\u{301}"    // 拼接一个重音，U+0301

print("the number of characters in \(word) is \(word.count)")
// 打印输出“the number of characters in café is 4”

//: [Next](@next)
