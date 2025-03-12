import SwiftUI

struct QuoteView: View {
    @StateObject private var quotesModel = DailyQuotesViewModel()

    var body: some View {
        VStack {
            if let quote = quotesModel.currentQuote {
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

private struct QuoteCard: View {
    let quote: QuoteModel

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.primaryColor)
            .frame(height: 100)
            .overlay(
                VStack(spacing: 4) {
                    Text("\"\(quote.quote)\"")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("- \(quote.author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
            )
    }
}

#Preview {
    QuoteView()
}
