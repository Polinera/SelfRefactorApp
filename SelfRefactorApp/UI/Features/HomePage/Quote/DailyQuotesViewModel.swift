import Foundation

enum QuoteError: Error {
    case fileNotFound
    case decodingError(Error)
    case emptyQuotesList
}

protocol QuoteProtocol {
    func loadQuotes() -> Result<[QuoteModel], QuoteError>
}

final class DailyQuotesViewModel: ObservableObject {
    @Published var currentQuote: QuoteModel?
    @Published var allQuotes: [QuoteModel] = []

    private var lastQuote: QuoteModel?
    
    private let quoteLoader: QuoteProtocol

    init(quoteLoader: QuoteProtocol) {
        self.quoteLoader = quoteLoader
        
        switch quoteLoader.loadQuotes() {
        case .success(let quotes):
            self.allQuotes = quotes
            pickRandomQuote()
        case .failure(let error):
            print("Error loading quotes: \(error)")
        }
    }

    func pickRandomQuote() {
        guard !allQuotes.isEmpty else {
            currentQuote = nil
            return
        }

        var newQuote: QuoteModel?
        repeat {
            newQuote = allQuotes.randomElement()
        } while newQuote == lastQuote && allQuotes.count > 1

        lastQuote = newQuote
        currentQuote = newQuote
    }
}

class BundleQuoteLoader: QuoteProtocol {
    func loadQuotes() -> Result<[QuoteModel], QuoteError> {
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json") else {
            return .failure(.fileNotFound)
        }

        do {
            let data = try Data(contentsOf: url)
            let quotes = try JSONDecoder().decode([QuoteModel].self, from: data)
            return .success(quotes)
        } catch {
            return .failure(.decodingError(error))
        }
    }
}
