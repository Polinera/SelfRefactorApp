
import Foundation

protocol GoalsRepositoryProtocol {
    func getGoals() throws -> [Goal]
    func save(goals: [Goal])
}

final class GoalsRepository: GoalsRepositoryProtocol {
    private let storageKey = "goals_storage_key"

    func getGoals() throws -> [Goal] {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            return []
        }
        return try JSONDecoder().decode([Goal].self, from: data)
    }

    func save(goals: [Goal]) {
        if let data = try? JSONEncoder().encode(goals) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}
