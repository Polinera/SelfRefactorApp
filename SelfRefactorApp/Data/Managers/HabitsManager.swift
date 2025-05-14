protocol HabitsManagerProtocol {
    func toggleHabit(_ habit: Habit)
    func getHabits() -> [Habit]
    func addHabit(with name: String)
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

    func getHabits() -> [Habit] {
        do {
            return try repository.getHabits()
        } catch  {
            return []
        }
    }

    func addHabit(with name: String) {
        let habit = Habit(name: name)

        var habits = getHabits()
        habits.append(habit)

        repository.save(habits: habits)
    }
}
