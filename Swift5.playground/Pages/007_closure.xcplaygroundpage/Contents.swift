//: [Previous](@previous)

import Foundation

/*:
 ## 闭包
 
 1. 函数的设计思路是将有一定功能的代码块包装在一起，通过函数名实现复用。
 2. 闭包的设计大多数情况下不是为了代码的复用，而是传递功能代码块和处理回调结构
 */

let closure = {(param: Int)->Int in
    return param * param;
}

//省略返回值
let closure2 = {(param: Int) in
    return param * param;
}


func mySort(array:inout Array<Any>, sortClosure:(Int,Int)->Bool) -> Array<Any> {
    //冒泡排序
    for indexI in array.indices {
        //最后一个元素直接返回
        if indexI == array.count - 1 {
            break;
        }
        //冒泡排序
        for indexJ in 0...((array.count - 1) - indexI - 1) {
            //调用闭包算法
            if sortClosure(indexJ,indexJ+1) {
                
            } else {
                //进行元素交换
                array.swapAt(indexJ, indexJ+1);
            }
        }
    }
    return array;
}
//: Any代表任意类型
var array:Array<Any> = [1,4,3,5,7,5,4,2,7];
mySort(array: &array) { (index:Int, nextIndex:Int) -> Bool in
    return (array[index] as! Int) > (array[nextIndex] as! Int);
}
//: 闭包只有一行代码组成可以省略return

mySort(array: &array) { (index:Int, nextIndex:Int) -> Bool in
    (array[index] as! Int) > (array[nextIndex] as! Int);
}

//: > 实际上当闭包作为函数的参数时，闭包参数列表会自动创建一组参数，参数会以`$0`, `$1`这样的结构一次类推
mySort(array: &array) {
    (array[$0] as! Int) > (array[$1] as! Int);
}

/*:
 ### 尾随闭包（Trailing closures），逃逸闭包，自动闭包
 
 > 当函数中的最后一个参数为闭包参数时，在调用函数时，开发者可以将闭包结构脱离出函数的参数列表，追加在函数的尾部，增强代码的可读性。
 */
mySort(array: &array) {
    (array[$0] as! Int) > (array[$1] as! Int);
}
//: 只有一个闭包参数的函数
func myfunc(closure: (Int,Int)->Bool) {
    
}
//: 进行闭包的后置 可以省略参数列表
myfunc {
    $0 > $1
}

/*:
 ### 逃逸闭包 - Escaping Closures
 * 所谓逃逸闭包，是指函数内的闭包在函数执行结束后在函数外依然可以进行使用，
 * 非逃逸闭包是指当函数的生命周期结束后，闭包也将被销毁。
 
 > 默认情况下函数参数中的闭包都为非逃逸闭包，这样做的优点是可以提高代码性能，节省内存消耗。
 */
func myfunc2(closure: @escaping (Int,Int)->Bool) {
    
}

/*:
 ### 自动闭包 - Autoclosures
 
 自动闭包的使用有严格的条件：
 
 1.此闭包不能有参数
 
 2.在调用函数传参时，此闭包的实现只能由一句表达式组成
 
 3.闭包的返回值即为此表达式的值
 */

//:`@autoclosure` 是使用在闭包类型之前，做的事情就是把一句表达式自动地封装成一个闭包 (closure)。

func logIfTrueNormal(predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}
//: > `@autoclosure`加到闭包的前面
func logIfTrueAutoclosure(predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}
// 调用方式
logIfTrueNormal(predicate: {3 > 1})
logIfTrueAutoclosure(predicate: 3 > 1)

//: 将闭包参数声明为自动闭包，逃逸闭包
func myfunc4(closure: @autoclosure @escaping ()->Bool) {
    
}


func getDefaultName() -> String {
    return ""
}

/*:
 `rethrows`与`throws`并没有太多不同，它们都是标记了一个方法应该抛出错误。
 但是 `rethrows` 一般用在参数中含有可以 `throws` 的方法的高阶函数中
 */
public func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T)
rethrows -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return try defaultValue()
    }
}
// 使用
var name: String? = "ferry"
let currentName = name ?? getDefaultName()

//: [Next](@next)
