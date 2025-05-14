import Foundation

struct MoodEntry: Identifiable, Codable, Equatable {
    let id: UUID
    let date: Date
    var mood: MoodType
}

enum MoodType: String, CaseIterable, Codable {
    case happy, neutral, sad, excited, tired, anxious, angry

    var emoji: String {
        switch self {
        case .happy: return "😄"
        case .neutral: return "😐"
        case .sad: return "😢"
        case .excited: return "🤩"
        case .tired: return "😴"
        case .anxious: return "😰"
        case .angry: return "😠"
        }
    }

    var label: String {
        self.rawValue.capitalized
    }

    var numericValue: Double {
        switch self {
        case .happy: return 1.0
        case .neutral: return 0.5
        case .sad: return 0.0
        case .excited: return 1.5
        case .tired: return 0.2
        case .anxious: return 0.3
        case .angry: return 0.1
        }
    }
}
