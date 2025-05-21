import Foundation

final class JournalViewModel: ObservableObject {
    @Published var entries: [Journal] = [] {
        didSet {
            save()
        }
    }

    private let saveKey = "journal_entries"

    init() {
        load()
    }

    func addEntry(_ entry: Journal) {
        entries.insert(entry, at: 0)
    }

    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(entries)
            UserDefaults.standard.set(data, forKey: saveKey)
        } catch {
            print("Failed to save journal entries:", error)
        }
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else {
            return
        }
        do {
            entries = try JSONDecoder().decode([Journal].self, from: data)
        } catch {
            print("Failed to load journal entries:", error)
        }
    }
}
