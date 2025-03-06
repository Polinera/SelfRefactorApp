
import SwiftUI

struct HabbitsPage: View {
    @StateObject var habitManager = HabitManager()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                if geometry.size.width > geometry.size.height {

                    VStack(spacing: 16) {
                        Text("Habits")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack(spacing: 16) {
                                ForEach(habitManager.habits) { habit in
                                    HabitRowView(habit: habit)
                                        .onTapGesture {
                                            habitManager.toggleHabit(habit)
                                        }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                } else {
                    VStack {
                        Text("Habits")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
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
            }
        }
    }
}



#Preview {
    HabbitsPage()
}
