
enum HabitRoute: Identifiable, Hashable {
    case addHabit
    var id : String {
        String( reflecting: self)
    }
}


