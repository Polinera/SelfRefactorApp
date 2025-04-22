
import SwiftUI

struct GoalsView: View {
    @StateObject private var manager = GoalManager()
    @State private var isLoading = true

    var body: some View {
        VStack {
            if isLoading {
                // Placeholder z animacją
                VStack {
                    ForEach(0..<3) { _ in
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 100, height: 20)
                                .shimmering() // Animacja shimmering
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .onAppear {
                    // Symulacja ładowania celów (tu czekamy 2 sekundy)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        // Po załadowaniu danych, ustawiamy isLoading na false
                        isLoading = false
                    }
                }
            } else {
                if manager.goals.isEmpty {
                    Text("No goals yet")
                        .foregroundColor(.gray)
                        .italic()
                } else {
                    // Po zakończeniu ładowania, wyświetlamy prawdziwe dane
                    List {
                        ForEach(manager.goals) { goal in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(goal.name).bold()
                                    Text(goal.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Button(action: {
                                    manager.toggleGoalCompletion(goal)
                                }) {
                                    Image(systemName: goal.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(goal.isCompleted ? .green : .red)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .padding()
    }
}

extension View {
    func shimmering() -> some View {
        self.overlay(
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0.6), Color.white.opacity(0.3)]), startPoint: .leading, endPoint: .trailing)
                .mask(self)
                .rotationEffect(.degrees(70))
                .offset(x: -200)
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: UUID())
        )
    }
}

class GoalManager: ObservableObject {
    @Published var goals: [Goal] = [
          Goal(name: "Read daily", description: "Read 20 pages of a book daily.", isCompleted: false),
          Goal(name: "Run 2km", description: "Go for a 2km run every morning.", isCompleted: true)
      ]
      
    func toggleGoalCompletion(_ goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index].isCompleted.toggle()
        }
    }
}

#Preview {
    GoalsView()
}
