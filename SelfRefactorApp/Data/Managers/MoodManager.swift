import Foundation

protocol MoodStorageProtocol {
    func loadMoods() -> [MoodEntry]
    func saveMoods(_ moods: [MoodEntry])
}

final class MoodStorage: MoodStorageProtocol {
    private let key = "mood_entries"

    func loadMoods() -> [MoodEntry] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let moods = try? JSONDecoder().decode([MoodEntry].self, from: data) else {
            return []
        }
        return moods
    }

    func saveMoods(_ moods: [MoodEntry]) {
        if let data = try? JSONEncoder().encode(moods) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
