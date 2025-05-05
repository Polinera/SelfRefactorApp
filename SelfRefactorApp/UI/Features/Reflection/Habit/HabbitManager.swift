import Foundation

class HabitManager: ObservableObject {
    @Published var habits: [Habit] = []

    private let fileName = "habit.json"

    init() {
        loadHabits()
        scheduleMidnightReset()
    }

    private func fileURL() -> URL {
        let manager = FileManager.default
        let docs = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docs.appendingPathComponent(fileName)
    }

    func loadHabits() {
        let url = fileURL()
        print("Looking for file at: \(url.path)")
        let manager = FileManager.default

        if manager.fileExists(atPath: url.path) {
            print("File exists in Documents.")
            do {
                let data = try Data(contentsOf: url)
                let loadedHabits = try JSONDecoder().decode([Habit].self, from: data)
                DispatchQueue.main.async {
                    self.habits = loadedHabits
                }
                print("Loaded habits from Documents: \(loadedHabits)")
            } catch {
                print("Error decoding habits.json from Documents: \(error)")
            }
        } else {
            print("File not found in Documents. Trying bundle...")
            if let bundleURL = Bundle.main.url(forResource: "habits", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: bundleURL)
                    let decodedHabits = try JSONDecoder().decode([Habit].self, from: data)
                    DispatchQueue.main.async {
                        self.habits = decodedHabits
                    }

                    try data.write(to: url)
                    print("Loaded habits from bundle: \(decodedHabits)")
                } catch {
                    print("Error loading habits from bundle: \(error)")
                }
            } else {
                print("habits.json not found in bundle. Loading sample habits...")
                let sampleHabits = [
                    Habit(name: "Drink water"),
                    Habit(name: "Exercise")
                ]
                self.habits = sampleHabits
                saveHabits()
                print("Loaded sample habits: \(sampleHabits)")
            }
        }
    }

    func saveHabits() {
        let url = fileURL()
        do {
            let data = try JSONEncoder().encode(habits)
            try data.write(to: url)
        } catch {
            print("Error saving habits: \(error)")
        }
    }

    func toggleHabit(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].isDone.toggle()
            saveHabits()
        }
    }

    func resetHabits() {
        for index in habits.indices {
            habits[index].isDone = false
        }
        saveHabits()
    }

    func scheduleMidnightReset() {
        let calendar = Calendar.current
        let now = Date()
        if let nextMidnight = calendar.nextDate(after: now,
                                                matching: DateComponents(hour: 0, minute: 0, second: 0),
                                                matchingPolicy: .nextTime) {
            let interval = nextMidnight.timeIntervalSince(now)
            Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] _ in
                self?.resetHabits()
                Timer.scheduledTimer(withTimeInterval: 24 * 60 * 60, repeats: true) { [weak self] _ in
                    self?.resetHabits()
                }
            }
        }
    }
}
