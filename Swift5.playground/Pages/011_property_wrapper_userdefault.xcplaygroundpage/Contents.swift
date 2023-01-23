//: [Previous](@previous)

import Foundation

//@propertyWrapper
//struct UserDefault<Value> {
//    let key: String
//    let defaultValue: Value
//    var container: UserDefaults = .standard
//
//    var wrappedValue: Value {
//        get {
//            return container.object(forKey: key) as? Value ?? defaultValue
//        }
//        set {
//            container.set(newValue, forKey: key)
//        }
//    }
//}
//
//extension UserDefaults {
//
//    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
//    static var hasSeenAppIntroduction: Bool
//
//    @UserDefault(key: "username", defaultValue: "Antoine van der Lee")
//    static var username: String
//
//    @UserDefault(key: "year_of_birth", defaultValue: 1990)
//    static var yearOfBirth: Int
//}
//
//extension UserDefaults {
//    static let groupUserDefaults = UserDefaults(suiteName: "group.com.swiftlee.app")!
//
//    @UserDefault(key: "has_seen_app_introduction", defaultValue: false, container: .groupUserDefaults)
//    static var hasSeenAppIntroduction2: Bool
//}
//
//UserDefaults.hasSeenAppIntroduction = true
//
//if UserDefaults.hasSeenAppIntroduction {
//    print("hasSeenAppIntroduction")
//}

/*Storing optionals using a User Defaults Property Wrapper*/
public protocol AnyOptional {
    /// Returns `true` if `nil`, otherwise `false`.
    var isNil: Bool { get }
}
extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    
    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            // Check whether we're dealing with an optional and remove the object if the new value is nil.
            if let optional = newValue as? AnyOptional, optional.isNil {
                container.removeObject(forKey: key)
            } else {
                container.set(newValue, forKey: key)
            }
        }
    }
    
    var projectedValue: Bool {
        return true
    }
}

extension UserDefault where Value: ExpressibleByNilLiteral {
    
    /// Creates a new User Defaults property wrapper for the given key.
    /// - Parameters:
    ///   - key: The key to use with the user defaults store.
    init(key: String, _ container: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, container: container)
    }
}

extension UserDefaults {
    
    @UserDefault(key: "year_of_birth")
    static var yearOfBirth: Int?
}

UserDefaults.yearOfBirth = 1990
print(UserDefaults.yearOfBirth) // Prints: 1990
UserDefaults.yearOfBirth = nil

//: [Next](@next)
