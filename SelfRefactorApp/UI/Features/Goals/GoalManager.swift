class GoalManager: ObservableObject {
    @Published var goals: [GoalModel] = [
          GoalModel(name: "Read daily", description: "Read 20 pages of a book daily.", isCompleted: false),
          GoalModel(name: "Run 2km", description: "Go for a 2km run every morning.", isCompleted: true)
      ]

    func toggleGoalCompletion(_ goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index].isCompleted.toggle()
        }
    }
}
