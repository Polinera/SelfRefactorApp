import SwiftUI

struct MoodMainPage: View {
    @ObservedObject var viewModel: MoodViewModel
    @State private var isShowingMoodPicker = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Mood diary")
                .font(.title2)
                .bold()
            
            if viewModel.topEmotions.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "face.smiling")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.secondaryColor)
                    
                    Text("No moods yet")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Start tracking your mood to see trends over time.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                    
                    Button(action: {
                        isShowingMoodPicker = true
                    }) {
                        Text("Log your first mood")
                            .font(.subheadline)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.myAccent.opacity(0.1))
                            .foregroundColor(.myAccent)
                            .cornerRadius(8)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
            } else {
                Text("Top emotions")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 16) {
                    ForEach(viewModel.topEmotions.prefix(3), id: \.mood) { emotionStat in
                        EmotionCardView(
                            emoji: emotionStat.mood.emoji,
                            percentage: emotionStat.percentage
                        )
                    }
                }
            }
        }
        .padding()
        .sheet(isPresented: $isShowingMoodPicker) {
            MoodPickerView { selectedMood in
                viewModel.saveMood(selectedMood)
                isShowingMoodPicker = false
            }
        }
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

