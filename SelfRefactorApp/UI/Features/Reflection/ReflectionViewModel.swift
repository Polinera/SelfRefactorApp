import Foundation

final class ReflectionViewModel: ObservableObject {

    @Published var isShowingAddHabit = false

    private let habitsManager: HabitsManagerProtocol

    init(habitsManager: HabitsManagerProtocol = HabitsManager()) {
        self.habitsManager = habitsManager
    }

    func addHabit(with name: String) {
        habitsManager.addHabit(with: name)
    }
}
