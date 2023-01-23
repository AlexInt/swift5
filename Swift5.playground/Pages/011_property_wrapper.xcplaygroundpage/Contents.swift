//: [Previous](@previous)

import Foundation

/*:
 ### 属性包装器
 
 属性包装器在管理属性如何存储和定义属性的代码之间添加了一个分隔层
 
 定义一个属性包装器，你需要创建一个定义`wrappedValue`属性的结构体、枚举或者类。
 */

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
/*:
 > 上面例子以`private`的方式声明`number`变量，这使得`number`仅在`TwelveOrLess` 的实现中使用。写在其他地方的代码通过使用`wrappedValue`的`getter`和`setter`来获取这个值，但不能直接使用`number`
 */
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// 打印 "0"

rectangle.height = 10
print(rectangle.height)
// 打印 "10"

rectangle.height = 24
print(rectangle.height)
// 打印 "12"

/*:
 当你把一个包装器应用到一个属性上时，编译器将合成提供包装器存储空间和通过包装器访问属性的代码。（属性包装器只负责存储被包装值，所以没有合成这些代码。）不利用这个特性语法的情况下，你可以写出使用属性包装器行为的代码
 */

struct SmallRectangle2 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
/*:
 `_height` 和 `_width` 属性存着这个属性包装器的一个实例，即 `TwelveOrLess`。`height` 和 `width` 的 getter 和 setter 把对 `wrappedValue` 属性的访问包装起来。
 */
var rectangle2 = SmallRectangle2()
print(rectangle2.height)
// 打印 "0"

rectangle2.height = 10
print(rectangle2.height)
// 打印 "10"

rectangle2.height = 24
print(rectangle2.height)

/*:
 为了支持设定一个初始值或者其他自定义操作，属性包装器需要添加一个构造器。这是 TwelveOrLess 的扩展版本，称为 SmallNumber。SmallNumber 定义了能设置被包装值和最大值的构造器：
 */

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}
/*:
 `SmallNumber`的定义包括三个构造器——`init()`、`init(wrappedValue:)` 和 `init(wrappedValue:maximum:)`——下面的示例使用这三个构造器来设置被包装值和最大值
 */

//:当你把包装器应用于属性且没有设定初始值时，Swift 使用`init()`构造器来设置包装器
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// 打印 "0 0"

//:当你为属性指定初始值时，Swift 使用`init(wrappedValue:)`构造器来设置包装器
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// 打印 "1 1"


struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// 打印 "2 3"

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// 打印 "5 4"

/*:
 当你在自定义特性后面把实参写在括号里时，Swift 使用接受这些实参的构造器来设置包装器。举例来说，如果你提供初始值和最大值，Swift 使用 `init(wrappedValue:maximum:)` 构造器:
 
 通过将实参包含到属性包装器中，你可以设置包装器的初始状态，或者在创建包装器时传递其他的选项。这种语法是使用属性包装器最通用的方法。你可以为这个属性提供任何所需的实参，且它们将被传递给构造器。
 */

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// 打印 "1"

mixedRectangle.height = 20
print(mixedRectangle.height)
// 打印 "12"
/*:
 调用 `SmallNumber(wrappedValue: 1)` 来创建包装 `height` 的 `SmallNumber` 的一个实例，这个实例使用默认最大值 12。调用 `SmallNumber(wrappedValue: 2, maximum: 9)` 来创建包装 `width` 的 `SmallNumber` 的一个实例。
 */

/*:
 #### 从属性包装器中投影Projecting一个值
 */
@propertyWrapper
struct SmallNumberProj {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure {
    @SmallNumberProj
    var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// 打印 "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// 打印 "true"
/*:
 `someStructure.$someNumber` 即可访问包装器的被投影值`projectedValue`
 
 属性包装器可以返回任何类型的值作为它的被投影值`projectedValue`。
 */

enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumberProj
    var height: Int
    
    @SmallNumberProj
    var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

//: > 属性包装器语法只是具有`getter`和`setter`的属性的语法糖

//: [Next](@next)
