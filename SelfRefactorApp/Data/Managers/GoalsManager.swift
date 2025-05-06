

import Foundation

protocol GoalsManagerProtocol {
    func toggleGoal(_ goal: Goal)
    func resetGoals()
    func getGoals() -> [Goal]
}

final class GoalsManager: GoalsManagerProtocol {
    private let repository: GoalsRepositoryProtocol

    init(repository: GoalsRepositoryProtocol = GoalsRepository()) {
        self.repository = repository
    }

    func toggleGoal(_ goal: Goal) {
        do {
            var goals = try repository.getGoals()
            if let index = goals.firstIndex(where: { $0.id == goal.id }) {
                goals[index].isCompleted.toggle()
                repository.save(goals: goals)
            }
        } catch {
            print("Toggle failed: \(error)")
        }
    }
    
    func resetGoals() {
        do {
            var goals = try repository.getGoals()
            goals = goals.map {
                var copy = $0
                copy.isCompleted = false
                return copy
            }
            repository.save(goals: goals)
        } catch {
            print("Reset failed: \(error)")
        }
    }

    func getGoals() -> [Goal] {
        do {
            return try repository.getGoals()
        } catch {
            return []
        }
    }
}
