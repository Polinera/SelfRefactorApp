
import SwiftUI

struct HomePage: View {
    @StateObject var quotesModel = DailyQuotesModel()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                if geometry.size.width > geometry.size.height {
                    HStack(spacing: 16) {
                        VStack {
                            Spacer()
                            QuoteView()
                            MoodMainPage()
                        }
                        .frame(width: geometry.size.width * 0.5)
                        VStack {
                            HabitsView()
                        }
                        .frame(width: geometry.size.width * 0.5)
                    }
                    .padding()
                } else {
                    VStack {
                        Spacer()
                        QuoteView()
                        MoodMainPage()
                        HabitsView()
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
