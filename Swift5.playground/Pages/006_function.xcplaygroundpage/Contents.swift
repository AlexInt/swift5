//: [Previous](@previous)

import Foundation
//: ## 函数
/*:
 ### 函数的创建与调用
 */
func isMoreThanTen(count: Int) -> Bool {
    return count > 10;
}

isMoreThanTen(count: 9);
//: ### 函数类型
//: #### 无参数有返回值
func myFunc1() -> String {
    return "string";
}
//: #### 无参数无返回值
func myFunc2() {
    print("无返回值");
}
//: #### 返回Optional类型参数
func myFunc3(param: Int) -> Int? {
    guard param > 100 else {
        return nil;
    }
    return param - 100;
}
/*:
 ### 函数的参数名
 swift引入了参数内部命名与外部命名的概念，内部命名在函数实现时使用，外部命名在函数调用时使用
 */
//: #### 多参数函数，默认内部命名与外部命名相同
func myFunc5(param1: Int, param2: Int, param3: Int) ->Int {
    return param1 + param2 + param3;
}
myFunc5(param1: 1, param2: 2, param3: 3);

//: #### 为函数添加外部命名
func myFunc6(out1 param1: Int, out2 param2: Int, out3 param3: Int) ->Int {
    return param1 + param2 + param3;
}

myFunc6(out1: 4, out2: 6, out3: 8);

//: #### 使用匿名变量标识符`_`来对外部名称进行省略
func myFunc7(_ param1: Int, _ param2: Int, _ param3: Int) ->Int {
    return param1 + param2 + param3;
}

myFunc7(0, 0, 0);

/*:
 ### 函数中参数的默认值，不定数量参数与`inout`类型参数
 */

func myFunc8(param1: Int, param2: Int = 10, param3: Int = 5) ->Int {
    return param1 + param2 + param3;
}

//对没有默认值的参数传参
myFunc8(param1: 8);
//每一个传值
myFunc8(param1: 0, param2: 9, param3: 8);

func myFunc9(param1: Int, param2: Int = 10, param3: Int) ->Int {
    return param1 + param2 + param3;
}
//对应参数位置要一致
myFunc9(param1: 1, param3: 3);

//: ### 不定数量参数 Variadic parameter
//> 在函数内部，开发者传递的值会被包装成一个集合类型赋值给对应参数
func myfunc10(param: Int...) {
    var sum = 0;
    for count in param {
        sum += count;
    }
    print(sum);
}
myfunc10(param: 1, 2, 3, 4, 5);
myfunc10(param: 1, 10);


func myfunc11(param: Int..., param2: String) {
    var sum = 0;
    for count in param {
        sum += count;
    }
    print(param2 + "\(sum)");
}
myfunc11(param: 1,5, 7, param2: "和是 ");

//: ### 在函数内部修改参数变量的值
func myfunc12(param: inout Int) {
    param += 1;
}
var para = 10;

myfunc12(param: &para);

/*:
 ### 函数的类型与嵌套
 */
//: #### 声明一个函数变量
var addFunc: (Int, Int)->Int;
//: #### 对函数变量进行赋值
addFunc = { (param1: Int, param2:Int) in
    return param2 + param1
}
//: #### 调用函数变量
addFunc(2, 3);

func myfunc13(param1: Int, param2: Int) -> Int {
    return param2 + param1;
}
//: #### 赋值另一个函数
addFunc = myfunc13;
addFunc(4,5);

//: ### 函数作为另一个函数的参数
func myfunc14(param:(Int,Int)->Int) ->Int {
    return param(20,5);
}
myfunc14 { return $0 + $1 }
myfunc14(param: addFunc);

//: ### 函数作为返回值
func myfunc15() -> (Int,Int)->Int {
    return {(param1:Int, param2:Int) in
        return param2 + param1;
    }
}
//使用addfunc变量获取该返回值
addFunc = myfunc15();

addFunc(23,9);

//: ### 函数内部创建函数
func myfunc16() -> (Int,Int)->Int {
    func subfunc(param1:Int, param2:Int) -> Int {
        return param1 + param2;
    }
    return subfunc;
}
//: >子函数只能在父函数内部调用，不可以在父函数外部调用，但是可以作为返回值传递到父函数外部


let str = [String.self,String.self]
str.forEach{
    print("🌰------\($0.self)")
}

//: [Next](@next)
