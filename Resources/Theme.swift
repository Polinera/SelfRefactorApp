import Foundation
import SwiftUI

//todo is this good idea? how commercial Swift app have coded colors ...
struct Theme {
    
    struct Fonts {
        static let primary: Font = .headline
        static let secondary: Font = .body
        static let title: Font = .title2
    }

    struct FontWeights {
        static let regular: Font.Weight = .regular
        static let bold: Font.Weight = .bold
        static let semibold: Font.Weight = .semibold
    }


    struct Frames {
        static let defaultWidth: CGFloat? = nil
        static let defaultHeight: CGFloat? = nil
    }

    struct Colors {
        static let primaryColor: Color = Color("primaryColor")
        static let secondaryColor: Color = Color("secondaryColor")
        static let accentColor: Color = Color("myAccentColor")
        static let textColor: Color = .black
    }

    struct Padding {
        static let standard: CGFloat = 16
        static let horizontal: CGFloat = 20
    }

    struct Radius {
        static let card: CGFloat = 20
    }
}
