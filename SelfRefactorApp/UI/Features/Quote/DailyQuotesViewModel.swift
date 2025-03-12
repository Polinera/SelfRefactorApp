
import Foundation

class DailyQuotesViewModel: ObservableObject {
    @Published var currentQuote: QuoteModel?
    @Published var allQuotes: [QuoteModel] = []
    
    init() {
        loadQuotes()
        updateQuote()
    }
  
    func loadQuotes() {
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json") else {
            print("Failed to locate quotes.json in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let quotes = try JSONDecoder().decode([QuoteModel].self, from: data)
            self.allQuotes = quotes
        } catch {
            print("Error loading quotes: \(error)")
        }
    }
    
    func updateQuote() {
        if let randomQuote = allQuotes.randomElement() {
            currentQuote = randomQuote
        } else {
            currentQuote = nil
        }
    }
}
