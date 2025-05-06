import Foundation

final class HistoryViewModel: ObservableObject {
    @Published var allPeople: [Person] = []
    @Published var filteredPeople: [Person] = []

    @Published var searchText: String = "" {
        didSet {
            filterPeople()
        }
    }

    init() {
        loadPeople()
    }

    func loadPeople() {
        guard let url = Bundle.main.url(forResource: "people", withExtension: "json") else {
            print("Could not find people.json")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedPeople = try JSONDecoder().decode([Person].self, from: data)
            self.allPeople = decodedPeople
            self.filteredPeople = decodedPeople
        } catch {
            print("Error decoding people.json: \(error)")
        }
    }

    private func filterPeople() {
        if searchText.isEmpty {
            filteredPeople = allPeople
        } else {
            filteredPeople = allPeople.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
