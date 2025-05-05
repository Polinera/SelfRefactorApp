import SwiftUI

struct HabitPagePartView: View {
//    @StateObject var habitManager = HabitManager()
    var habits: [Habit]
    var onHabitTapped: ((Habit) -> Void)?

    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

    private var isLandscape: Bool { orientation.isLandscape }

    private var columnCount: Int { isLandscape ? 4 : 2 }

    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 16), count: columnCount)
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(habits) { habit in
                    HabitRowView(habit: habit)
                        .onTapGesture {
                            onHabitTapped?(habit)
                        }
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    HabitPagePartView(habits: [])
}
