import SwiftUI

struct QuoteView: View {
    @StateObject var quotesModel = DailyQuotesModel()
    
    var body: some View {
        VStack {
            if let quote = quotesModel.currentQuote {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.primaryColor)
                    .frame(height: 100)
                    .overlay(
                        VStack {
                            Text("\"\(quote.quote)\"")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("- \(quote.author)")
                                .font(.subheadline)
                                .padding(.top, 4)
                        }
                        .padding()
                    )
                    .padding()
            } else {
                Text("No quote available")
            }
        }
    }
}

#Preview {
    QuoteView()
}
