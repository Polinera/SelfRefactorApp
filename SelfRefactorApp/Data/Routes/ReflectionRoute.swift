
enum ReflectionRoute: Identifiable, Hashable {
    case addHabit
    case goal
    case mood
    case journal
    
    var id : String {
        String( reflecting: self)
    }
}
