import Foundation

final class HabitsViewModel: ObservableObject {
    
    @Published var habits: [Habit] = []
    
    private let habitsManager: HabitsManagerProtocol
    
    init(habitsManager: HabitsManagerProtocol = HabitsManager()) {
        self.habitsManager = habitsManager
    }
    
    func getHabits() {
        habits = habitsManager.getHabits()
    }
    
    func toggle(habit: Habit) {
        habitsManager.toggleHabit(habit)
        
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].isDone.toggle()
        }
    }
}
