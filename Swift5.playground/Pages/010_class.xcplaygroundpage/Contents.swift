//: [Previous](@previous)

import Foundation

/*:
 ## 类 - class
 */
class ClassCar {
    var price: Int
    var brand: String
    var petrol: Int
    
    func drive() {
        if petrol>0 {
            petrol -= 1
            print("drive 10 milo");
        }
    }
    
    func addPetrol() {
        petrol += 10;
        print("add 10 unit fuel");
    }
    
    //构造方法
    init(price:Int, brand:String, petrol:Int) {
        self.price = price;
        self.brand = brand;
        self.petrol = petrol;
    }
}
/*:
 > 在结构体中开发者并不需要提供构造方法，结构体会根据属性自动生成一个构造方法，而类则要求开发者自己提供构造方法。
 */


//类的继承
class Transportation {
    var petrol: Int = 10;
    
    func drive() {
        if petrol == 0 {
            self.addPetrol();
        }
    }
    
    func addPetrol() {
        petrol += 10;
    }
}

//: ### 继承自父类
class Vehicle: Transportation {
    var tyre: Int
    
    //对父类方法进行重写
    override func drive() {
        super.drive()
        print("run 10km")
        self.petrol -= 1;
    }
    init(tyreCount: Int) {
        self.tyre = tyreCount;
    }
}

//: ### final 和 static的区别
//: #### final修饰某些终极的属性、方法或者类，被修饰的方法或属性不能被子类覆写

//仅用于类名前，表示该类不能被继承。仅支持class类型
final class Manager {
    // 单例的声明
    static let shared = Manager()
    // 实例属性，可被重写
    var name: String = "Ferry"
    // 实例属性，不可被重写
    final var lastName: String = "Zhang"
    // 类属性，不可被重写
    static var address: String = "Beijing"
    // 类属性，可被重写。注意只能作为计算属性，而不能作为存储属性
    class var code: String {
        return "0122"
    }
  
    // 实例函数，可被重写
    func download() {
      /* code... */
    }
    // 实例函数，不可被重写
    final func downloadNoNeedOverride() {
      /* code... */
    }
    // 类函数，可被重写
    class func removeCache() {
         /* code... */
    }
    // 类函数，不可被重写
    static func download() {
      /* code... */
    }
}

//: > `struct`和`enum`因为不能被继承，所以也就无法使用`class`和`final`关键词，仅能通过`static`关键词进行限定
struct Boss {
    // 单例的声明
    static let shared = Boss()
    // 类属性
    static var name: String = "Ferry"
    // 类函数
    static func download() {
      /* code... */
    }
}


//: [Next](@next)
