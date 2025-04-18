
import SwiftUI

struct MoodMainPage: View {
    let offset = CGSize(width: 0, height: 100)
    let text = "Top emotions"
    
    var body: some View {
        VStack {
            Text(String(localized: "Mood diary"))
            Text(text)
            
            HStack {
                MainPageEmojiView(rating: 90, total: 100, emoji: "😎", animate: true)
                MainPageEmojiView(rating: 45, total: 100, emoji: "😜", animate: true)
                MainPageEmojiView(rating: 75, total: 100, emoji: "🤩", animate: true)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MoodMainPage()
}
