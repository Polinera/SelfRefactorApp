import Foundation

final class MoodViewModel: ObservableObject {
    @Published var moodEntries: [MoodEntry] = []
    @Published var todayMood: MoodType? = nil

    private let storage: MoodStorageProtocol

    init(storage: MoodStorageProtocol = MoodStorage()) {
        self.storage = storage
        loadMoods()
    }

    func loadMoods() {
        moodEntries = storage.loadMoods()
        todayMood = moodEntries.first(where: { Calendar.current.isDateInToday($0.date) })?.mood
    }

    func saveMood(_ mood: MoodType) {
        if let index = moodEntries.firstIndex(where: { Calendar.current.isDateInToday($0.date) }) {
            moodEntries[index].mood = mood // update
        } else {
            let newEntry = MoodEntry(id: UUID(), date: Date(), mood: mood)
            moodEntries.insert(newEntry, at: 0)
        }

        storage.saveMoods(moodEntries)
        todayMood = mood
    }
    
    var topEmotions: [EmotionStat] {
            let total = moodEntries.count
            guard total > 0 else { return [] }

            let counts = Dictionary(grouping: moodEntries, by: \.mood).mapValues { $0.count }

            return counts.map { mood, count in
                EmotionStat(mood: mood, percentage: Int((Double(count) / Double(total)) * 100))
            }
            .sorted(by: { $0.percentage > $1.percentage })
        }
    
}

struct EmotionStat {
    let mood: MoodType
    let percentage: Int
}

