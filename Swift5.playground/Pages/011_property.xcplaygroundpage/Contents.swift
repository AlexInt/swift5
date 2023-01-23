//: [Previous](@previous)

import Foundation

/*:
 ## 属性
 
 Swift语言中对于属性的定义分为两类，分别是存储属性与计算属性。
 * 存储属性的作用是存储类的某个特征，而计算属性的作用是通过运算告知外界类的某个特征。
 * 存储属性只能用于类和结构体，计算属性可以用于类、结构体和枚举。
 */
/*:
 * 方法用来定义事物的行为，其实质是具有特殊意义的函数。
 * 方法也被分为实例方法和类方法，实例方法用于描述类型实例的行为，类方法描述整体类型的行为。
 */
struct PointImmutalble {
    var x: Double
    var y: Double
}

class Description {
    var name: String
    init(name: String) {
        self.name = name;
    }
}
/*:
 在类中有一个原则，即当类实例被构造完成时，必须保证类中所有的属性都构造或者初始化完成
 */
class PointC {
    var x: Double
    var y: Double
    
    //延时存储属性
    lazy var description: Description = Description(name: "teacher")
    
    init(x: Double, y: Double) {
        self.x = x;
        self.y = y;
    }
}
/*:
 > 延时存储属性就是指在类实例构造的时候，延时存储属性并不进行构造或初始化，只有当开发者调用到类实例的这个属性时，此属性才完成构造或初始化操作。
 >
 > 延时存储属性不是线程安全的，如果在多线程中对延时存储属性进行调用，不能保证其只能被构造一次
 */

/*:
 >
 > * 对于值类型实例，如果实例是常量接收的，则其中变量的属性也不可以修改，
 > * 对于引用类型实例，无论实例是变量还是常量接收的，都可以修改变量类型的属性
 */
let point = PointImmutalble(x: 2, y: 1)
//point.x = 0 //change 'let' to 'var' to make it mutable

let point2 = PointC(x: 2, y: 2);
point2.y = 5.0;

/*:
 ### 计算属性
 */
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
            //单句，可以省略return
        }
        //        set(newCenter) {
        //            origin.x = newCenter.x - (size.width / 2)
        //            origin.y = newCenter.y - (size.height / 2)
        //        }
        set { //可以省略括号内的(newCenter)，系统会用newValue替代
            
            //计算属性的setter也可以用来监听计算属性的变化
            print("\(center.x) -- \(center.y)")
            print("\(newValue.x) -- \(newValue.y)")
            
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
// initialSquareCenter is at (5.0, 5.0)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"

//: #### 只读计算属性

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 打印“the volume of fourByFiveByTwo is 40.0”

/*:
 > 必须使用`var`关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。`let` 关键字只用来声明常量属性，表示初始化后再也无法修改的值。
 */

//: ### 属性观察器 Property Observers - willSet & didSet

/*:
 你可以在以下位置添加属性观察器：
 * 自定义的存储属性
 * 继承的存储属性
 * 继承的计算属性
 
 >对于继承的属性，你可以在子类中通过重写属性的方式为它添加属性观察器。
 
 >对于自定义的计算属性来说，使用它的 setter 监控和响应值的变化，而不是尝试创建观察器。
 
 */
/*:
 > 在父类初始化方法调用之后，在子类构造器中给父类的属性赋值时，会调用父类属性的`willSet`和`didSet` 观察器。而在父类初始化方法调用之前，给子类的属性赋值时不会调用子类属性的观察器
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步


class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做——因为车辆不一定会有噪音
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
/*:
 > 你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供`willSet`或`didSet`实现也是不恰当。 此外还要注意，你不可以同时提供重写的`setter` 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的`setter`，那么你在`setter` 中就可以观察到任何值变化了。
 */

/*:
 > 如果将带有观察器的属性通过 in-out 方式传入函数`willSet`和`didSet`也会调用。这是因为 in-out 参数采用了拷入拷出内存模式：即在函数内部使用的是参数的 copy，函数结束后，又对参数重新赋值。
 */

//: [Next](@next)
