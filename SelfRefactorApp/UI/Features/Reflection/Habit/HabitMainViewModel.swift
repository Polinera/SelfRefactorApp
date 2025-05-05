//
//  HabitMainViewModel.swift
//  SelfRefactorApp
//
//  Created by Renata Garlicka on 17/04/2025.
//

import Foundation

final class HabitMainViewModel: ObservableObject {

    @Published var habits: [Habit] = []

    private let manager: HabitsManagerProtocol

    init(manager: HabitsManagerProtocol = HabitsManager()) {
        self.manager = manager
    }

    func toggle(habit: Habit) {
        manager.toggleHabit(habit)
    }

    func getHabits() {
        habits = manager.getHabits()
    }
}
