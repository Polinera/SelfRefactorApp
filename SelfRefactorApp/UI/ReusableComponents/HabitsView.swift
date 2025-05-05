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
            List {
                Section(header: Text("Your Habits").font(.headline)) {
                    ForEach(habitManager.habits) { habit in
                        HStack {
                            Label(habit.name, systemImage: habit.isDone ? "checkmark.circle.fill" : "circle")
                                .labelStyle(.titleAndIcon)
                                .foregroundColor(habit.isDone ? .green : .primary)
                            
                            Spacer()
                            
                            if habit.isDone {
                                Text("Done")
                                    .font(.caption)
                                    .foregroundColor(.green)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            habitManager.toggleHabit(habit)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    HabitsView()
}
