
import Foundation

enum HabitsRepositoryError: Error {
    case failedToDecode
}

protocol HabitsRepositoryProtocol {
    func getHabits() throws -> [Habit]
    func save(habits: [Habit])
}

final class HabitsRepository: HabitsRepositoryProtocol {

    private let fileManager: FileManager
    private let  userDefaults: UserDefaults

    private let fileName = "habit.json"
    private let storageKey = "habits_storage_key"

    init(fileManager: FileManager = .default, userDefaults: UserDefaults = .standard) {
        self.fileManager = fileManager
        self.userDefaults = userDefaults
    }

    func getHabits() throws -> [Habit] {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            return getInitialHabits()
        }
        return try JSONDecoder().decode([Habit].self, from: data)
    }

    func save(habits: [Habit]) {
        do {
            let data = try JSONEncoder().encode(habits)
            userDefaults.set(data, forKey: storageKey)
        } catch {
            print("Error saving habits: \(error)")
        }
    }

    private var fileURL: URL {
        let manager = FileManager.default
        let docs = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docs.appendingPathComponent(fileName)
    }

    private func getInitialHabits() -> [Habit] {
        let sampleHabits = [
            Habit(name: "Drink water"),
            Habit(name: "Exercise")
        ]

        if let bundleURL = Bundle.main.url(forResource: "habits", withExtension: "json") {
            let habits = try? getHabits(for: bundleURL)
            return habits ?? sampleHabits
        } else {
            return sampleHabits
        }
    }

    private func getHabits(for url: URL) throws -> [Habit] {
        do {
            let data = try Data(contentsOf: url)
            let decodedHabits = try JSONDecoder().decode([Habit].self, from: data)
            return decodedHabits
        } catch {
            throw HabitsRepositoryError.failedToDecode
        }
    }


}
