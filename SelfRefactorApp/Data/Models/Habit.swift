
import SwiftUI

struct Habit: Identifiable, Codable {
    let id = UUID()
    let name: String
    var isDone: Bool = false
}

