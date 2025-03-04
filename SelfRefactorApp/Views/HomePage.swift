
import SwiftUI

struct HomePage: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var quotesModel = DailyQuotesModel()
    @StateObject var modelHabit = MainPageHabitsModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                if geometry.size.width > geometry.size.height {
                    HStack(spacing: 16) {
                        VStack {
                            QuoteView()
                            
                            MoodMainPage()
                        }
                        .frame(width: geometry.size.width * 0.5)
                        
                        VStack {
                            HabitsMainPageView()
                        }
                        .frame(width: geometry.size.width * 0.5)
                    }
                    .padding()
                } else {
                    VStack {
                        Spacer()
                        
                        QuoteView()
                        
                        HabitsMainPageView()
                        
                        MoodMainPage()
                        
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
