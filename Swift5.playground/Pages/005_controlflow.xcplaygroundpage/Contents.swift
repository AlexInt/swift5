//: [Previous](@previous)

import Foundation

//: ## 流程控制

/*: ### for循环*/
//第一个参数为捕获参数
for index in 1...5 {
    print(index);
}

var sum = 0;
//如果不需要捕获到的值，可以使用匿名参数来接收
for _ in 1...3 {
    sum += 1;
}

//: #### 遍历集合
var collection1: Array = [1,2,3,4];
var collection2: Dictionary = [1:1, 2:2, 3:4, 4:4];
var collection3: Set = [1, 2, 3, 4];
for obj in collection1 {
    print(obj);
}
for (key,value) in collection2 {
    print(key,value);
}
for obj in collection3 {
    print(obj);
}

/*: ### while与repeat-while循环*/
var i = 0;
//当不小于10时跳出循环
while i<10 {
    print("while", i);
    i+=1;
}

var j = 0;
//先执行一次循环体，再判断循环条件是否成立
repeat {
    j+=1;
    print("repeat while", j);
} while j < 10;

//: ### if, if-else
var c = 10

if c<10 {
    print(c);
}

if c > 10 {
    c-=10
    print(c);
} else {
    print(c)
}



//: ### 流程跳转语句
//: #### continue用于跳过本次循环，直接开始下次循环
MyLabel : for indexI in 0...2 {
    for indexJ in 0...2 {
        if indexI == 1 {
            continue MyLabel;
        }
        print("第\(indexI) \(indexJ)次循环")
    }
}

//: #### break直接中断包含它的循环结构
MyLabel : for indexI in 0...2 {
    for indexJ in 0...2 {
        if indexI == 1 {
            break MyLabel;
        }
        print("第\(indexI) \(indexJ)次循环")
    }
}



//: [Next](@next)
