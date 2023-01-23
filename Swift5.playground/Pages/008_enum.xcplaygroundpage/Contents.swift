//: [Previous](@previous)

import Foundation

/*:
 ## enum 枚举
 
 函数的功能是进行数据计算，枚举的功能是数据的描述
 */

/*:
 ### 枚举的关联值
 
 在定义枚举值的时候，开发者可以为其设置一个参数列表，这个参数列表被称为枚举的关联值。
 */
enum Shape {
    case circle(center: (Double, Double), radius: Double)
    case rect(center: (Double, Double), width: Double, height: Double)
    case triangle(point1: (Double, Double), point2: (Double, Double), point3: (Double, Double))
}

var circle = Shape.circle(center: (0.0,0.0), radius: 3.0);
var rect = Shape.rect(center: (1.0,1.0), width: 10.0, height: 15.0);
var triangle = Shape.triangle(point1: (2.0,2.0), point2: (3.0,3.0), point3: (2.0,5.0));

func shapeFunc(param: Shape) {
    switch param {
        //进行参数捕获
    case let .circle(center, radius):
        print("\(center) -- \(radius)");
    case let .rect(center,width,height):
        print("\(center)----\(width)-----\(height)");
    case let .triangle(point1, point2, point3):
        print("\(point1)-----\(point2)-----\(point3)");
    }
}

shapeFunc(param: circle);
shapeFunc(param: rect);
shapeFunc(param: triangle);

/*:
 ### 递归枚举
 
 使用递归的方式进行数据的描述
 */
//使用枚举来模拟加减乘除四则运算
enum ExpressionSingle {
    //表示加法运算
    case add(param1:Int, param2:Int)
    //表示减法运算
    case sub(param1:Int, param2:Int)
    //表示乘法运算
    case mul(param1:Int, param2:Int)
    //表示除法运算
    case div(param1:Int, param2:Int)
}
//Expression枚举模拟的是一种四则运算表达式类型，如果要进行运算
//开发者还需要实现具体的功能函数。

//使用上面创建的枚举来描述四则运算表达式
var exp1 = ExpressionSingle.add(param1: 5, param2: 5);
var exp2 = ExpressionSingle.sub(param1: 10, param2: 5);
var exp3 = ExpressionSingle.mul(param1: 5, param2: 5);
var exp4 = ExpressionSingle.div(param1: 10, param2: 2);

//ExpressionSingle描述的是单运算表达式，不能够进行复合表达式的描述

enum Expression {
    //描述单个数字
    case num(param:Int)
    //表示加法运算 将Expression作为关联值参数类型
    indirect case add(param1:Expression,param2:Expression)
    //表示减法运算
    indirect case sub(param1:Expression,param2:Expression)
    //表示乘法运算
    indirect case mul(param1:Expression,param2:Expression)
    //表示除法运算
    indirect case div(param1:Expression,param2:Expression)
}
/*
 如果一个枚举中所有的枚举值都是可递归的，开发者可以直接将整个枚举类型声明为可递归的，即在enum前直接加关键字indirect
 */

//创建单值5
var num5 = Expression.num(param: 5);
//5 + 5
var expAdd = Expression.add(param1: num5, param2: num5)
//单值2
var num2 = Expression.num(param: 2);
//(5+5)*2
var expMul = Expression.mul(param1: expAdd, param2: num2);
//8
var num8 = Expression.num(param: 8);
//(5+5)*2-8
var expSub = Expression.sub(param1: expMul, param2: num8);
//((5+5)*2-8)/2
var expDiv = Expression.div(param1: expSub, param2: num2);

//这个递归函数的作用是将Expression描述的表达式进行运算结果返回
func expressionFunc(param:Expression) -> Int {
    switch param {
    case let .num(param):
        return param;
    case let .add(param1, param2):
        return expressionFunc(param: param1) + expressionFunc(param: param2);
    case let .sub(param1,param2):
        return expressionFunc(param: param1) - expressionFunc(param: param2);
    case let .mul(param1, param2):
        return expressionFunc(param: param1) * expressionFunc(param: param2);
    case let .div(param1, param2):
        return expressionFunc(param: param1) / expressionFunc(param: param2);
    }
}

expressionFunc(param: expDiv);


/*
 递归算法效率十分高，但是其效能资源的耗费也十分严重
 */

//: [Next](@next)
