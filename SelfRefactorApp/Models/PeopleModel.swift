import Foundation

class PeopleModel: ObservableObject {
    @Published var allPeople: [Person] = []
    @Published var searchText: String = ""

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
        } catch {
            print("Error decoding people.json: \(error)")
        }
    }
}
