//: [Previous](@previous)

import Foundation

//: ## 运算符重载

/*:
 * 重载运算符和自定义运算符都是开发者自定义运算符功能的手段。
 * 重载运算符是给系统已经存在的运算符追加新的功能；
 * 自定义运算符是完全自定义一个系统不存在的运算符来实现特定的运算功能。
 */

/*:
 重载的概念最初是针对函数的，对一个函数名，设置不同的参数类型以实现不同的功能被称为函数的重载。
 */

//: ### 函数的重载

//创建整型的加法函数
func addFunc(param1: Int, param2: Int) -> Int {
    return param1 + param2;
}

//重载addFunc实现浮点数数据的加法
func addFunc(param1:Double, param2: Double) -> Double {
    return param1 + param2;
}

//再次重载addFunc实现字符串数据的加法
func addFunc(param1:String, param2: String) -> String {
    return param1 + param2;
}
addFunc(param1: 3, param2: 4);

//: ### 运算符的重载
class Circle {
    var center: (Double, Double);
    var radius: Double;
    init(center:(Double, Double), radius:Double) {
        self.center = center;
        self.radius = radius;
    }
}

//重载运算符使两个Circle实例能够相加
func +(param1:Circle, param2: Circle) ->Circle {
    return Circle(center: param1.center, radius: param1.radius + param2.radius);
}

/*:
 ### 自定义运算符
 
 分为两步：
 1. 需要将要定义的运算符进行声明
 2. 进行自定义运算符的实现，
     前缀与后缀只能有一个参数，
     中缀运算符需要有两个参数，且func关键字前不需要额外表明
 */

//: #### 自定义前缀运算符`++`
//:1. 声明
prefix operator ++
//:2. 实现
prefix func ++(param: Int) -> Int {
    return param + 1;
}
//:3. 调用
++5; //6


//: #### 自定义中缀运算符`++`
//:1. 声明
infix operator ++
//:2. 实现 func前不需要额外表明
func ++(param1: Int, param2: Int) ->Int {
    return param1*param1 + param2*param2;
}
//:3. 调用
5++4; //41


//: #### 自定义后缀运算符`++`
//:1. 声明
postfix operator ++
//:2. 实现
postfix func ++(param1: Int) ->Int {
    return param1 + param1;
}
//:3. 调用
5++  //10

/*:
 > 自定义运算符常使用以下作为开头：`/  =  - + ! * % < > & | ^ ? ~`
 */

/*:
 > 如果`.`出现在自定义运算符的开头，则运算符中可以出现多个符号`.`，如`.+.`
 > 如果`.`不在开头，那么只允许出现一个符号`.`（单个`.`不可以重载或自定义）
 */

//:> Swift语言中保留符号不可以**单独**被重载和自定义：`= -> // /* */ . < > & ? !`



//: [Next](@next)
