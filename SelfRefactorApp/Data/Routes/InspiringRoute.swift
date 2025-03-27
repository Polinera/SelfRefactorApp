enum InspiringRoute:Identifiable, Hashable {
    case addHistory
    var id : String {
        String(reflecting:self)
    }
}
