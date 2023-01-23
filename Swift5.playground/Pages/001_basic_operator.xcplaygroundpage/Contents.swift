//: [Previous](@previous)

import Foundation

/*:
 ## 运算符
 在编程中，运算有表达式表示，而量值和运算符共同构成了表达式。
 */
/*:
 运算符的作用在与将量值或者表达式结合在一起进行计算。
 * 一元运算符：作用于一个操作数(如：正负运算符“+”，“-”及逻辑非运算符"!")
 * 二元运算符：作用于两个操作数（如加减运算符，赋值运算符）
 * 三元运算符：作用于3个操作数之间（如三目运算符）
 */

//: ### 赋值运算符(用于值的传递，其结果是量值被赋了具体的值)
var str = "Hello";
var count = 5;
var group = (1,"a");
var bol = true;

//: ### 算术运算符
//相加运算
1 + 2
"hello, " + "world"  // 等于 "hello, world"

//相减运算
2 - 1

//相乘运算
2 * 2

//相除运算
4/2
10.0 / 2.5  // 等于 4.0

//取余运算(必须在整数间进行运算时使用)
4 % 3
4 % -3

-9 % 4   // 等于 -1
//:> 在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的。

//: ### 复合赋值运算符
var tmp = 1
//加赋值复合运算
tmp += 3 //tmp = tmp = 3
//减赋值复合运算
tmp -= 3 //tmp = tmp - 3
//乘赋值复合运算
tmp *= 3 //tmp = tmp * 3
//除赋值复合运算
tmp /= 3 //tmp = tmp / 3
//取余赋值复合运算
tmp %= 3 //tmp = tmp % 3

//: >负运算符会改变数据的正负性，正运算符会保持数据的正负性
var a = 1;
var b = -2;
+b //-2
-a //-1

//:  ### 基本逻辑运算符
var p1 = true;
var p2 = false;
//逻辑与运算
p1 && p2
//逻辑或运算
p1 || p2
//逻辑非运算
!p1
/*:
 > 与OC不同，swift语言中逻辑运算的操作数必须为严格的bool类型
 */

//:  ### 比较运算符(返回一个Bool类型的逻辑值)
1 == 2 //等于比较
1 < 2  //小于比较
1 > 2  //大于比较
1 != 2 //不等于比较
1 <= 2 //小于等于比较
1 >= 2 //大于等于比较

//:  ### 条件运算符
var m = 3
var n = 6
if m > n {
    print("m > n");
} else {
    print("m < n");
}
//: > 上面等于下面的表达
print(m>n ? "m>n" : "m<n")

//: ### 空合并运算符(swift中特殊的运算符)
var q: Int? = 8;
var value: Int;
if q != nil {
    value = q!;
} else {
    value = 0
}
//: > 上面等于下面的表达
value = q ?? 0

//: ### 区间运算符(swift中特殊的运算符)
//:创建范围>=0 且<= 10的闭区间
var range1 = 0...10;
//:创建范围>=0 且 < 10的半开区间
var range2 = 0..<10;


//:通过“~="是运算符检查某个数字是否包含于范围中
print(range1 ~= 8) //true

for index in 0...3 {
    print(index);
}
/*: > 在`for-in`循环结构中， 如果`in`关键字后面是一个集合，则变量`index`会自动获取集合中的元素；
如果`in`关键字后面是一个范围，则`index`获取到的是从左向右依次遍历到的范围索引数。
 */

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex

let r2 = ...5 //PartialRangeThrough<Int>
r2.contains(4) //true
r2.contains(6) //false
r2.contains(-2) //true


let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)
//Here are three more double quotes: "

let line = #"Line 1\nLine 2"#
print(line)
//Line 1\nLine 2

//: [Next](@next)
