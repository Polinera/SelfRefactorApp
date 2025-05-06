
import Foundation

enum HabitsRepositoryError: Error {
    case failedToDecode
}

protocol HabitsRepositoryProtocol {
    func getHabits() throws -> [Habit]
    func save(habits: [Habit])
    //    func toggleHabit(_ habit: Habit)
    //    func resetHabits()
}

final class HabitsRepository: HabitsRepositoryProtocol {

    private let fileManager: FileManager
    private let fileName = "habit.json"

    private var fileURL: URL {
        let manager = FileManager.default
        let docs = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docs.appendingPathComponent(fileName)
    }

    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    func getHabits() throws -> [Habit] {
        if fileManager.fileExists(atPath: fileURL.path) {
            return try getHabits(for: fileURL)
        } else {
            if let bundleURL = Bundle.main.url(forResource: "habits", withExtension: "json") {
                let habits = try getHabits(for: bundleURL)
                // save to file manager
                return habits
            } else {
                let sampleHabits = [
                    Habit(name: "Drink water"),
                    Habit(name: "Exercise")
                ]
                return sampleHabits
            }
        }
    }

    func save(habits: [Habit]) {
        do {
            let data = try JSONEncoder().encode(habits)
            try data.write(to: fileURL)
        } catch {
            print("Error saving habits: \(error)")
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
