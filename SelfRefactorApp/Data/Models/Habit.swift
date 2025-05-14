
import SwiftUI

struct Habit: Identifiable, Equatable, Codable {
    let id = UUID()
    let name: String
    var isDone: Bool = false
}

