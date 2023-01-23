//: [Previous](@previous)

import Foundation

//: ## callAsFunction

struct Adder {
    var base: Int
    func callAsFunction(_ x: Int) -> Int {
        return base + x
    }
}

let add2 = Adder(base: 2)
print(add2(6)) // 8

enum France {
    case paris
    func callAsFunction() -> String {
        return "The capital city"
    }
}

let fp = France.paris
fp();

/*:
 > 这里的 `callAsFunction(...)`函数，就是Swift 编译器约定的名字，这个函数可以有 0-N 个参数，甚至不定参也可以的。除了函数名字的约定，基本上没有任何可以限制你发挥的地方，你可以加上泛型，甚至可以用 `class` 或者 `enum`，当然这种对象一般是值类型语义，所以类型定义成`struct`是最常见的，其次是`enum`也可以的，而定义成`class` 的话一要记得引用类型的开销，二是必须给它添加`init`构造函数。
 */

//: ## Swift Callables

/*:
 > 在 Swift 中这种不是函数，但可以当成函数一样调用对象还有哪些呢？我们来盘点一下：

 1. 函数类型的值，在 Swift 中函数是一等公民，有类型，有值。所以`callAsFunction`也可以被赋值给函数类型，供之后调用，这不是针对`callAsFunction`的新特性，对于其他名称的方法也可以这样。
 */

let f: (Int) -> Int = add2.callAsFunction(_:)
print(f(6)) // 8

/*:
 2.类型名称，我们经常使用 `UIView(...)` 形式来构造对象，但实际上这个语法糖会被转换成函数调用 `UIView.init(...)`
 */

/*:
 3.`@dynamicCallable` 修饰的类型，多用于与动态语言的交互。
 * [how-to-use-dynamiccallable-in-swift](https://www.hackingwithswift.com/articles/134/how-to-use-dynamiccallable-in-swift)
 * [@dynamicCallable in Swift explained with code examples](https://www.avanderlee.com/swift/dynamiccallable/)
 */
@dynamicCallable
struct DummyCallable {
    func dynamicallyCall(withArguments: [Int]) {
        print(withArguments)
    }
    func dynamicallyCall(withKeywordArguments: KeyValuePairs<String, Int>) {
        print(withKeywordArguments)
    }
}

let x = DummyCallable()
x(1,2,3) // [1, 2, 3]
x(Leon: 28, 178) // ["Leon": 28, "": 178]

//: [Next](@next)
