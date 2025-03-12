import SwiftUI
import UIKit

struct HabitsView: View {
    @StateObject var habitManager = HabitManager()
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

    private var isLandscape: Bool { orientation.isLandscape }
    
    private var habitViews: some View {
        ForEach(habitManager.habits) { habit in
            HabitRowView(habit: habit)
                .onTapGesture { habitManager.toggleHabit(habit) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Habits")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ScrollView(isLandscape ? .horizontal : .vertical, showsIndicators: false) {
                    AdaptiveLazyStack(isLandscape: isLandscape, spacing: 16) {
                        habitViews
                    }
                    .padding(.horizontal)
                }
                .frame(minHeight: 200)
            }
            .padding()
            .onRotate { newOrientation in
                orientation = newOrientation
            }
        }
    }
}

#Preview {
    HabitsView()
}
