//: [Previous](@previous)

import UIKit

//: ## 枚举的高级用例
enum TextType: CaseIterable {
    case title
    case subtitle
    case sectionTitle
    case body
    case comment
}

var fonts = [TextType : UIFont]()

for type in TextType.allCases {
    switch type {
    case .title:
        fonts[type] = .preferredFont(forTextStyle: .headline)
    case .subtitle:
        fonts[type] = .preferredFont(forTextStyle: .subheadline)
    case .sectionTitle:
        fonts[type] = .preferredFont(forTextStyle: .title2)
    case .body:
        fonts[type] = .preferredFont(forTextStyle: .body)
    case .comment:
        fonts[type] = .preferredFont(forTextStyle: .footnote)
    }
}



struct EnumMap<Enum: CaseIterable & Hashable, Value> {
    private let values: [Enum : Value]

    init(resolver: (Enum) -> Value) {
        var values = [Enum : Value]()

        for key in Enum.allCases {
            values[key] = resolver(key)
        }

        self.values = values
    }

    subscript(key: Enum) -> Value {
//         Here we have to force-unwrap, since there's no way
//         of telling the compiler that a value will always exist
//         for any given key. However, since it's kept private
//         it should be fine - and we can always add tests to
//         make sure things stay safe.
        return values[key]!
    }
}

let fontTypes = EnumMap<TextType, UIFont> { type in
    switch type {
    case .title:
        return .preferredFont(forTextStyle: .headline)
    case .subtitle:
        return .preferredFont(forTextStyle: .subheadline)
    case .sectionTitle:
        return .preferredFont(forTextStyle: .title2)
    case .body:
        return .preferredFont(forTextStyle: .body)
    case .comment:
        return .preferredFont(forTextStyle: .footnote)
    }
}

let titleFont = fontTypes[.title]
let subtitleFont = fontTypes[.subtitle]




class ProductListViewController: UITableViewController { }
class FeaturedProductCell: UITableViewCell { }
class ProductCell: UITableViewCell { }
class CategoryCell: UITableViewCell { }
class BookmarkCell: UITableViewCell { }

extension ProductListViewController {
    enum Section: String, CaseIterable {
        case featured
        case onSale
        case categories
        case saved
    }
}
extension ProductListViewController {
    func registerCellClasses() {
        let resolver: (Section) -> UITableViewCell.Type = { section in
            switch section {
            case .featured:
                return FeaturedProductCell.self
            case .onSale:
                return ProductCell.self
            case .categories:
                return CategoryCell.self
            case .saved:
                return BookmarkCell.self
            }
        }

        for section in Section.allCases {
            tableView.register(resolver(section),
                               forCellReuseIdentifier: section.rawValue)
        }
        
        //
        tableView.registerCellClasses(for: ProductListViewController.Section.self) { section in
            switch section {
            case .featured:
                return FeaturedProductCell.self
            case .onSale:
                return ProductCell.self
            case .categories:
                return CategoryCell.self
            case .saved:
                return BookmarkCell.self
            }
        }
    }
}

extension UITableView {
    func registerCellClasses<T: CaseIterable & RawRepresentable>(
        for sectionType: T.Type,
        using resolver: (T) -> UITableViewCell.Type
    ) where T.RawValue == String {
        for section in sectionType.allCases {
            register(resolver(section), forCellReuseIdentifier: section.rawValue)
        }
    }
}

//: [Next](@next)
