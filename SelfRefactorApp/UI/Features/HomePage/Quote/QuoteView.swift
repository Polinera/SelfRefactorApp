import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = DailyQuotesViewModel(quoteLoader: BundleQuoteLoader())

    var body: some View {
        VStack {
            if let quote = viewModel.currentQuote {
                QuoteCard(quote: quote)
                    .padding()
            } else {
                Text("No quote available")
                    .foregroundColor(.secondary)
                    .italic()
            }
        }
    }
}

struct QuoteCard: View {
    let quote: QuoteModel

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("“\(quote.quote)”")
                .font(.body)
                .multilineTextAlignment(.center)

            Text("- \(quote.author)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(radius: 2)
    }
}

#Preview {
    QuoteView()
}
