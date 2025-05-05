//
//  GoalsViewModel.swift
//  SelfRefactorApp
//
//  Created by Piotr Torczynski on 29/04/2025.
//

import Foundation

final class GoalsViewModel: ObservableObject {

    enum State {
        case loading
        case loaded([Goal])
        case error
    }

    @Published var state: State = .loading

    func getGoals() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.state = .loaded([
                Goal(name: "Read daily", description: "Read 20 pages of a book daily.", isCompleted: false),
                Goal(name: "Run 2km", description: "Go for a 2km run every morning.", isCompleted: true)
            ])
        }
    }

    func toggleGoalCompletion(_ goal: Goal) {
        switch state {
        case .loaded(let goals):
            var copy = goals
            if let index = copy.firstIndex(where: { $0.id == goal.id }) {
                copy[index].isCompleted.toggle()
            }
            state = .loaded(copy)
        default: break
        }
    }
}
