//
//  MainPageHabbitsModel.swift
//  SelfRefactorApp
//
//  Created by REGC on 25/02/2025.
//

import Foundation

class MainPageHabitsModel:ObservableObject{
    @Published var habits: [Habit] = [
        Habit(name: "Dranking water"),
        Habit(name: "Exercise"),
        Habit(name: "Read a book"),
        Habit(name: "Practise coding")
    ]
    
    func toggleHabitDone(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].isDone.toggle()
        }
    }
}
