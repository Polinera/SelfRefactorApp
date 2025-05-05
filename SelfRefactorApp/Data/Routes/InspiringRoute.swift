enum InspiringRoute: Identifiable, Hashable {

    case addHistory
    case detailedPerson(Person)

    var id : String {
        String(reflecting:self)
    }

    static func == (lhs: InspiringRoute, rhs: InspiringRoute) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
