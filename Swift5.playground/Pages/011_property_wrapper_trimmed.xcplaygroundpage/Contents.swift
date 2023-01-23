//: [Previous](@previous)

import Foundation

//https://nshipster.com/propertywrapper/

@propertyWrapper
struct Trimmed {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Post {
    @Trimmed var title: String
    @Trimmed var body: String
}

var quine = Post(title: "  Swift Property Wrappers  ", body: "…")
quine.title // "Swift Property Wrappers" (no leading or trailing spaces!)

quine.title = "      @propertyWrapper     "
quine.title // "@propertyWrapper" (still no leading or trailing spaces!)


//: [Next](@next)
