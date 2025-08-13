import SwiftUI

struct MoodView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = MoodViewModel()
    @State private var isShowingMoodSheet = false
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                if let mood = viewModel.todayMood {
                    Text("Today's mood: \(mood.emoji) \(mood.label)")
                } else {
                    Text("No mood logged today")
                }
                
                Button("Choose your mood") {
                    isShowingMoodSheet = true
                }
                .padding()
                .background(Color.myAccent.opacity(0.1))
                .foregroundColor(.myAccent)
                .cornerRadius(12)
                
                Divider().padding(.vertical)
                
                MoodChartView(viewModel: viewModel)
            }
            .sheet(isPresented: $isShowingMoodSheet) {
                MoodPickerView { selectedMood in
                    viewModel.saveMood(selectedMood)
                    isShowingMoodSheet = false
                }
            }
            .padding()
        }
    }
}

//// todo popraw viewModel

#Preview {
    MoodView()
}
