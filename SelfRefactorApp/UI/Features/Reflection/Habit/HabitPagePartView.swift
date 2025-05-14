import SwiftUI

struct HabitPagePartView: View {
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

struct HabitRowView: View {
    let habit: Habit

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(habit.isDone ? .myAccent : .secondaryColor)
            .frame(height: 80)
            .overlay(
                Text("\(habit.isDone ? "Done " : "")\(habit.name)")
                    .foregroundColor(.black)
                    .padding()
            )
    }
}

#Preview {
    HabitPagePartView(habits: [])
}
