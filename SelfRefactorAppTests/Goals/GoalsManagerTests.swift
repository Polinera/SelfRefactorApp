
import Testing
import Foundation
@testable import SelfRefactorApp

final class MockGoalsRepository: GoalsRepositoryProtocol {
    var storedGoals: [Goal]
    var savedGoals: [Goal] = []
    var shouldThrowOnGet = false

    init(initialGoals: [Goal] = []) {
        self.storedGoals = initialGoals
    }

    func getGoals() throws -> [Goal] {
        if shouldThrowOnGet { throw NSError(domain: "TestError", code: 1) }
        return storedGoals
    }

    func save(goals: [Goal]) {
        savedGoals = goals
        storedGoals = goals
    }
}

@Test
func toggleGoal_whenGoalExists_togglesCompletion() {
    // Arrange
    let goal = Goal(name: "Test Goal", description: "A test goal", isCompleted: false)
    var repo = MockGoalsRepository(initialGoals: [goal])
    let sut = GoalsManager(repository: repo)

    // Act
    sut.toggleGoal(goal)

    // Assert
    #expect(repo.savedGoals.count == 1)
    #expect(repo.savedGoals[0].isCompleted)
}

@Test
func toggleGoal_whenGoalNotFound_doesNotSave() {
    let goal = Goal(name: "Test Goal", description: "A test goal", isCompleted: false)
    var repo = MockGoalsRepository(initialGoals: [])
    let sut = GoalsManager(repository: repo)

    sut.toggleGoal(goal)

    #expect(repo.savedGoals.isEmpty)
}

@Test
func resetGoals_setsAllGoalsToNotCompleted() {
    let goals = [
        Goal(name: "G1", description: "A test goal", isCompleted: true),
        Goal(name: "G2", description: "A test goal", isCompleted: false)
    ]
    var repo = MockGoalsRepository(initialGoals: goals)
    let sut = GoalsManager(repository: repo)

    sut.resetGoals()

    #expect(repo.savedGoals.count == 2)
    #expect(repo.savedGoals.allSatisfy { !$0.isCompleted })
}

@Test
func getGoals_returnsGoalsFromRepository() {
    let goals = [Goal(name: "G1", description: "A test goal", isCompleted: false)]
    let repo = MockGoalsRepository(initialGoals: goals)
    let sut = GoalsManager(repository: repo)

    let result = sut.getGoals()

    #expect(result == goals)
}

@Test
func getGoals_whenRepositoryThrows_returnsEmptyArray() {
    var repo = MockGoalsRepository()
    repo.shouldThrowOnGet = true
    let sut = GoalsManager(repository: repo)

    let result = sut.getGoals()

    #expect(result.isEmpty)
}
