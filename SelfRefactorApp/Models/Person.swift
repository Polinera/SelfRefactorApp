

import Foundation

struct Person: Codable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let image: String
}
