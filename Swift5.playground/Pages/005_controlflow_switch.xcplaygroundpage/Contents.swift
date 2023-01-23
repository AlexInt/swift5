//: [Previous](@previous)

import Foundation

/*:
 ## 流程控制
 
 ### switch语句
 
 `switch`只要`case`命中即跳出结构，不管下面有没有`case`继续命中
 */
//: #### 使用`switch`语句进行字符分支匹配
var charac: Character = "c";
switch charac {
case "a":
    print("charac is a")
case "b":
    print("charac is b")
case "c":
    print("charac is c")
default: //用于处理其他额外情况
    print("no charac")
}

//: #### 同一个case中可以包含多个分支
switch charac {
case "a", "b", "c":
    print("charac is word");
case "1", "2", "3":
    print("charac is number");
default:
    print("no charac");
}

//: #### 在case中也可以使用range范围
var num = 3;
switch num {
case 1...3:
    print("1<=num<=3");
case 4:
    print("match 4");
default:
    print("no match")
}

//: #### 使用switch语句进行元祖的匹配
var tuple = (0,0);
switch tuple {
case (0,1):
    print("进行完全匹配") //即所有元素都必须相等，才成功
case (_,1):
    print("进行选择性匹配") //指定元祖中一些元素进行匹配
case (0...3,0...3):
    print("进行元祖元素的范围匹配") //相应位置指定的范围包含匹配元祖相应位置的值，就算成功
default:
    print("");
}

//: #### 进行数据绑定
switch tuple {
    //对元祖中的第一个元素进行捕获
case (let a, 1):
    print("a", a);
case (let b, 0): //首先匹配第二个参数0，匹配成功后赋值给b,然后case中的代码块可以使用常量b
    print("b", b);
    //捕获元祖中的两个元素，let(a,b)与(let a, let b)意义相同
case let (a,b): //始终匹配成功
    print(a,b);
default:
    print("")
}

switch tuple {
case (let a, 1):
    print("a", a);
    //当元祖中的两个元素都等于0时才匹配成功，并且捕获第一个元素的值。
case (let b,0) where b == 0:
    print("b", b);
    //当元祖中的两个元素相同时，才会进入下面的case
case let(a, b) where a==b:
    print(a,b);
default:
    print("")
}

//: #### fallthrough
switch tuple {
case (0,0):
    print("sure");
    fallthrough; //穿透执行下一个case
case (_ ,0):
    print("sim");
default:
    print("")
}

//: [Next](@next)
