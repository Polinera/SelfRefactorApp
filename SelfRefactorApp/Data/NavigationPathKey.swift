import Foundation
import SwiftUI

extension EnvironmentValues {
    private struct NavigationPathKey : EnvironmentKey{
        static let defaultValue : Binding<NavigationPath> = .constant(.init())
    }
    
    var navigationPath : Binding <NavigationPath> {
        get{ self[NavigationPathKey.self]}
        set{ self[NavigationPathKey.self] = newValue}
    }
}
