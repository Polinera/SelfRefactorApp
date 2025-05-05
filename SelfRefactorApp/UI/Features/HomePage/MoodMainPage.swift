
import SwiftUI

struct MoodMainPage: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Mood diary")
                .font(.title2)
                .bold()

            Text("Top emotions")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack(spacing: 16) {
                EmotionCardView(emoji: "😎", percentage: 90)
                EmotionCardView(emoji: "😜", percentage: 45)
                EmotionCardView(emoji: "🤩", percentage: 75)
            }
        }
        .padding()
    }
}

struct EmotionCardView: View {
    let emoji: String
    let percentage: Int

    var body: some View {
        VStack(spacing: 8) {
            Text(emoji)
                .font(.system(size: 40))

            Text("\(percentage)%")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 80, height: 100)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}


#Preview {
    MoodMainPage()
}
