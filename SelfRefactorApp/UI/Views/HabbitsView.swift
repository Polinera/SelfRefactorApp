import SwiftUI

struct HabbitsPage: View {
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    @StateObject private var habitManager = HabitManager()

    var body: some View {
        NavigationView {
            layout
                .onRotate { newOrientation in
                    orientation = newOrientation
                }
        }
    }
//todo ask is it better to create viewBuilder or just if in View? 
    @ViewBuilder
    private var layout: some View {
        if orientation.isLandscape {
            landscapeLayout
        } else {
            portraitLayout
        }
    }

    private var landscapeLayout: some View {
        VStack(spacing: 16) {
            Text("Habits")
                .font(.title)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(habitManager.habits) { habit in
                        HabitRowView(habit: habit)
                            .onTapGesture {
                                habitManager.toggleHabit(habit)
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
    }
    
    private var portraitLayout: some View {
        VStack(spacing: 16) {
            Text("Habits")
                .font(.title)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(habitManager.habits) { habit in
                        HabitRowView(habit: habit)
                            .onTapGesture {
                                habitManager.toggleHabit(habit)
                            }
                           
                        .frame(width: 200)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
    }
}

struct HabitRowView: View {
    let habit: Habit
    @StateObject private var habitManager = HabitManager()

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
    HabbitsPage()
}
