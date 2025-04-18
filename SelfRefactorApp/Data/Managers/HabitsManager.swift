//
//  HabitsManager.swift
//  SelfRefactorApp
//
//  Created by Renata Garlicka on 17/04/2025.
//

protocol HabitsManagerProtocol {
    func toggleHabit(_ habit: Habit)
    func resetHabits()

    func getHabits() -> [Habit]
}

final class HabitsManager: HabitsManagerProtocol {
    private let repository: HabitsRepositoryProtocol

    init(repository: HabitsRepositoryProtocol = HabitsRepository()) {
        self.repository = repository
    }

    func toggleHabit(_ habit: Habit) {
        do {
            var habits = try repository.getHabits()
            if let index = habits.firstIndex(where: { $0.id == habit.id }) {
                habits[index].isDone.toggle()
                repository.save(habits: habits)
            }
        } catch {

        }

    }

    func resetHabits() {

    }

    func getHabits() -> [Habit] {
        do {
            return try repository.getHabits()
        } catch  {
            return []
        }
    }
}
