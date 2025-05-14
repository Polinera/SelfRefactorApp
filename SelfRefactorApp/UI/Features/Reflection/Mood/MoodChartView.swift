import Charts
import SwiftUI

enum MoodChartRange: String, CaseIterable {
    case weekly = "Past 7 Days"
    case monthly = "Past 30 Days"
}

struct MoodChartView: View {
    @ObservedObject var viewModel: MoodViewModel
    @State private var selectedRange: MoodChartRange = .weekly

    var body: some View {
        VStack {
            Picker("Range", selection: $selectedRange) {
                ForEach(MoodChartRange.allCases, id: \.self) { range in
                    Text(range.rawValue).tag(range)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Chart {
                ForEach(filteredMoods(), id: \.id) { entry in
                    LineMark(
                        x: .value("Date", entry.date),
                        y: .value("Mood", entry.mood.numericValue)
                    )
                    .foregroundStyle(.myAccent)
                    .symbol(Circle())
                }
            }
            .frame(height: 200)
        }
    }

    func filteredMoods() -> [MoodEntry] {
        let now = Date()
        let calendar = Calendar.current
        let cutoff: Date

        switch selectedRange {
        case .weekly:
            cutoff = calendar.date(byAdding: .day, value: -6, to: now)!
        case .monthly:
            cutoff = calendar.date(byAdding: .day, value: -29, to: now)!
        }

        return viewModel.moodEntries.filter { $0.date >= cutoff }
    }
}
