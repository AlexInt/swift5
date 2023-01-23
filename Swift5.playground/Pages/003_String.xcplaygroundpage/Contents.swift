//: [Previous](@previous)

import Foundation
//: ## 字符串
/*:
 ### 字符串的构造
*/
//: 直接赋值
var str: String = "Hello, string";
// 直接赋值为空字符串
str = "";

//: 通过构造方法来进行str变量的构造
str = String();                               //构造空字符串 “”
str = String("hello");                        //通过字符串构造"hello"
str = String(6666);                           //通过整数数据构造"6666"
str = String(6.66);                           //通过浮点型数据构造"6.66"
str = String("a");                            //通过字符构造"a"
str = String(false);                          //通过Bool值构造"false"
str = String(describing: (1, 1.0, true))      //通过元祖构造"(1, 1.0, true)"
str = String(format: "a little %@", "doggy"); //通过格式化字符串构造"a little doggy"

str = String(describing: Int.self)             //通过类型来构造字符串"Int"

/*:
 ### 字符串的组合
 */
var c1 = "Hello";
var c2 = "World";
var c3 = c1 + " " + c2; //"Hello World"
//字符串插值
var d = "Hello \(123)"; //"Hello 123"
var d2 = "Hello \(c2)";  //"Hello World"


/*:
### 字符串操作的常用方法
*/

//: 1. 判断字符串是否为空
var obj1 = "";
if obj1.isEmpty {
    print("字符串为空字符串");
}
if obj1.count == 0 {
    print("字符串为空字符串");
}

//: 2. 字符串比较
var com1 = "30a"
var com2 = "31a"

/*:
 如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等，那就认为它们是相等的。只要可扩展的字形群集有同样的语言意义和外观则认为它们标准相等，即使它们是由不同的 Unicode 标量构成。
 
 例如，LATIN SMALL LETTER E WITH ACUTE(U+00E9)就是标准相等于 LATIN SMALL LETTER E(U+0065)后面加上 COMBINING ACUTE ACCENT(U+0301)。这两个字符群集都是表示字符 é 的有效方式，所以它们被认为是标准相等的
 */
// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”

//:比较两个字符串是否相等，只有两个字符串中的所有位置的字符都相等时，才为相等的字符串
if com1 == com2 {
    print("com1和com2相等");
}
//:比较两个字符串的大小时，会逐个对字符的大小进行比较，直至遇到不相等的字符为止
if com1 < com2 {
    print("com1比com2小")
}

//: 获取字符串起始下标与结束下标
var string = "Hello-Swift";
var startIndex = string.startIndex; //类型为String.Index
var endIndex = string.endIndex;

/*:
 > 为什么Swift 的字符串不能用整数（integer）做索引？
 > 每一个 String 值都有一个关联的索引（index）类型，`String.Index`，它对应着字符串中的每一个 `Character` 的位置。
 前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道 `Character` 的确定位置，就必须从 `String` 开头遍历每一个 `Unicode` 标量直到结尾。因此，Swift 的字符串不能用整数（integer）做索引。
 */

//: 获取某个下标后一个下标对应的字符`char = "e"`
let afterIndex = string.index(after: startIndex)
var char = string[afterIndex]; //"e"

//最后一个字符
let beforeIndex = string.index(before: endIndex)
var char2 = string[beforeIndex]; //"t"

//: 通过范围获取字符串中的一个子串
//: `offsetBy`:是下标移动的位数，正数为下标向后移动相应位数，负数为下标向前移动相应位数
let helloRange = startIndex...string.index(startIndex, offsetBy: 4)
var subString = string[helloRange]; //"Hello"

let swiftRange = string.index(endIndex, offsetBy: -5)..<endIndex
var subString2 = string[swiftRange]; //"Swift"

/*:
 ### 对字符串进行追加、插入、替换、删除等操作
*/
//:获取某个子串在父串中的范围
var range = string.range(of: "Hello"); //类型为Range<String.Index>?
//:追加一个字符
string.append(Character("!")); //"Hello-Swift!"
//:追加字符串操作
string.append(" Hello-World"); //"Hello-Swift! Hello-World"

//:插入
//在指定位置插入一个字符
string.insert("~", at: string.index(string.startIndex, offsetBy: 12)); //"Hello-Swift!~ Hello-World"
//在指定位置插入一组字符 //"Hello-Swift!~~~~ Hello-World"
string.insert(contentsOf: ["~","~","~"], at: string.index(string.startIndex, offsetBy: 12));

//:替换
//在指定范围替换一个字符串  //"Hi-Swift!~~~~ Hello-World"
string.replaceSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 4), with: "Hi");

//:删除
//在指定位置删除一个字符 //删除之后的字符串"Hi-Swift!~~~~ Hello-Worl"
string.remove(at: string.index(before: string.endIndex));  //返回删除的字符"d"
//删除指定范围的字符 此时string为 "Swift!~~~~ Hello-Worl"
string.removeSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 2));
//删除所有字符 此时为：""
string.removeAll();

string = "new string";
string.removeLast() //"new strin"
string.removeLast(2)

let a = string.dropFirst()
print(string)

//: 字符串大小写转换
var string2 = "My name is Jimmy";
//全部转换为大写
string2 = string2.uppercased();
//全部转换为小写
string2 = string2.lowercased();

//: 检查字符串的前缀和后缀
string2.hasPrefix("My");
string2.hasSuffix("Jimmy");

/*: ### 子字符串`String.SubSequence`
 
 当你从字符串中获取一个子字符串 —— 例如，使用下标或者 prefix(_:) 之类的方法 —— 就可以得到一个 Substring 的实例，而非另外一个 String。Swift 里的 Substring 绝大部分函数都跟 String 一样，意味着你可以使用同样的方式去操作 Substring 和 String。然而，跟 String 不同的是，你只有在短时间内需要操作字符串时，才会使用 Substring。当你需要长时间保存结果时，就把 Substring 转化为 String 的实例，长期存储很容易引起内存泄漏。
 */

let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index] //String.SubSequence
// beginning 的值为 "Hello"

// 把结果转化为 String 以便长期存储。
let newString = String(beginning)

/*:
 
 就像 String，每一个 Substring 都会在内存里保存字符集。而 String 和 Substring 的区别在于性能优化上，Substring 可以重用原 String 的内存空间，或者另一个 Substring 的内存空间（String 也有同样的优化，但如果两个 String 共享内存的话，它们就会相等）。这一优化意味着你在修改 String 和 Substring 之前都不需要消耗性能去复制内存。就像前面说的那样，Substring 不适合长期存储 —— 因为它重用了原 String 的内存空间，原 String 的内存空间必须保留直到它的 Substring 不再被使用为止。
 
 上面的例子，`greeting` 是一个 String，意味着它在内存里有一片空间保存字符集。而由于 `beginning` 是 `greeting` 的 Substring，它重用了 `greeting` 的内存空间。相反，`newString` 是一个 String —— 它是使用 Substring 创建的，拥有一片自己的内存空间。
 
 > String 和 Substring 都遵循 `StringProtocol` 协议，这意味着操作字符串的函数使用 StringProtocol 会更加方便。你可以传入 String 或 Substring 去调用函数。
 */

//: `prefix(_:)`

let rawInput = "126 a.b 22219 zzzzzz"
let numericPrefix = rawInput.prefix(while: { "0"..."9" ~= $0 })
// numericPrefix is the substring "126"

//: > 不要存储超过执行特定操作所需的子字符串。子字符串保持它来自的字符串的整个存储的引用，而不仅仅是它所呈现的部分，即使没有其他对原始字符串的引用也是如此。因此，存储子字符串可能会延长无法再以其他方式访问的字符串数据的生命周期，这似乎是内存泄漏。

let numbers = [1, 2, 3, 4, 5]
//O(1)
print(numbers.prefix(2))
// Prints "[1, 2]"
print(numbers.prefix(10))
// Prints "[1, 2, 3, 4, 5]"

let numbers2 = [10, 20, 30, 40, 50, 60]
//O(1)
if let i = numbers2.firstIndex(of: 40) {
   print(numbers2.prefix(upTo: i))
}
// Prints "[10, 20, 30]"
if let i = numbers.firstIndex(of: 40) {
    print(numbers[..<i])
}
// Prints "[10, 20, 30]"

/*:
 ### 字符串的 Unicode 表示形式
 当一个 Unicode 字符串被写进文本文件或者其他储存时，字符串中的 Unicode 标量会用 Unicode 定义的几种 编码格式（encoding forms）编码。每一个字符串中的小块编码都被称 编码单元（code units）。这些包括 UTF-8 编码格式（编码字符串为 8 位的编码单元）， UTF-16 编码格式（编码字符串位 16 位的编码单元），以及 UTF-32 编码格式（编码字符串32位的编码单元）。
 
 Swift 提供了几种不同的方式来访问字符串的 Unicode 表示形式。你可以利用 `for-in` 来对字符串进行遍历，从而以 Unicode 可扩展的字符群集的方式访问每一个`Character` 值。该过程在 使用字符 中进行了描述。
 
 另外，能够以其他三种 Unicode 兼容的方式访问字符串的值：
 
 * UTF-8 代码单元集合（利用字符串的 utf8 属性进行访问）
 * UTF-16 代码单元集合（利用字符串的 utf16 属性进行访问）
 * 21 位的 Unicode 标量值集合，也就是字符串的 UTF-32 编码格式（利用字符串的 unicodeScalars 属性进行访问）
 */
let dogString = "Dog‼🐶"
/*:
 #### UTF-8 表示
 
 你可以通过遍历 String 的 `utf8` 属性来访问它的 UTF-8 表示。其为 `String.UTF8View` 类型的属性，`UTF8View` 是无符号 8 位（`UInt8`）值的集合，每一个 `UInt8` 值都是一个字符的 UTF-8 表示：
 */

//String.UTF8View.Element
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 226 128 188 240 159 144 182

/*:
 #### UTF-16 表示
 
 你可以通过遍历 String 的 `utf16` 属性来访问它的 UTF-16 表示。其为 `String.UTF16View` 类型的属性，`UTF16View` 是无符号16位（`UInt16`）值的集合，每一个 `UInt16` 都是一个字符的 UTF-16 表示：
 */

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 8252 55357 56374

/*:
 #### Unicode 标量表示
 你可以通过遍历 String 值的 `unicodeScalars` 属性来访问它的 Unicode 标量表示。其为 `UnicodeScalarView` 类型的属性，`UnicodeScalarView` 是 `UnicodeScalar` 类型的值的集合。
 每一个 `UnicodeScalar` 拥有一个 `value` 属性，可以返回对应的 21 位数值，用 UInt32 来表示：
 */
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// 68 111 103 8252 128054


//:字符串分隔为数组
//: #### Split by a string
let greetingStr = "Hello! Swift String."
let greetingComponents = greetingStr.components(separatedBy: " ")
//["Hello!", "Swift", "String."]

//: 数组拼接为字符串

let array = ["Andrew", "Ben", "John", "Paul", "Peter", "Laura"]
let joined = array.joined(separator: ", ")
//"Andrew, Ben, John, Paul, Peter, Laura"

//: 数组拼接为字符串 - 英语式的拼接
let names = ["Ash", "Brock", "Misty"]
let joined1 = ListFormatter.localizedString(byJoining: names)
//print(joined1)
//Ash, Brock, and Misty


//: #### 使用字符去分割字符串
func values(fromCSVString str: String) -> [String] {
    let separators = CharacterSet(charactersIn: ",;")
    return str.components(separatedBy: separators)
}

let semicolonsCSV = "1997;Ford;E350"
let semicolonsValues = values(fromCSVString: semicolonsCSV)

let commaCSV = "1997,Ford,E350"
let commaValues = values(fromCSVString: commaCSV)

//["1997", "Ford", "E350"]

//: #### Split by a character
let line = "a b c  d"
let lineItems = line.split(separator: " ")
//["a", "b", "c", "d"]

let omittingEmptyLineItems = line.split(separator: " ", omittingEmptySubsequences: false)
// ["a", "b", "c", "", "d"]

let maxSplitsLineItems = line.split(separator: " ", maxSplits: 2)
// ["a", "b", "c d"]


///trimming
let whitespStr = "  Taylor Swift  "
let trimmed = str.trimmingCharacters(in: .whitespacesAndNewlines)
//"Taylor Swift”.



//: [Next](@next)
