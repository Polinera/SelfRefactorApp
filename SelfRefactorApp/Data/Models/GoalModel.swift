import SwiftUI

struct Goal: Identifiable, Codable, Equatable {
    let id = UUID()
    var name : String
    var description : String
    var isCompleted: Bool
}
