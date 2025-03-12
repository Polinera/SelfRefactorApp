
import Foundation

struct QuoteModel : Codable, Identifiable {
    let id: UUID = UUID ()
    let quote : String
    let author : String
}
