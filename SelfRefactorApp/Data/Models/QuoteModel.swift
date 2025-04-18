
import Foundation

struct QuoteModel : Codable, Identifiable, Equatable {
    let id: UUID = UUID ()
    let quote : String
    let author : String
}
