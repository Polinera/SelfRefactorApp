
enum ReflectionRoute: Identifiable, Hashable {
    case goal
    case mood
    case journal
    
    var id : String {
        String( reflecting: self)
    }
}
