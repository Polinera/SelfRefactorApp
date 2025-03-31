import SwiftUI

struct GoalModel: Identifiable, Codable {
    let id = UUID()
    var name : String
    var description : String
    var isCompleted: Bool
}
