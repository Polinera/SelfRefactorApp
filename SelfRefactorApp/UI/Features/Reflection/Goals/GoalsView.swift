
import SwiftUI

struct GoalsView: View {
    @StateObject private var viewModel = GoalsViewModel()

    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                loadingStateView
            case .loaded(let array):
                makeLoadedStateView(for: array)
            case .error:
                Text("Wystapil blad")
            }
        }
        .onAppear {
            viewModel.getGoals()
        }
    }

    private var loadingStateView: some View {
        VStack {
            ForEach(0..<3) { _ in
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 20)
                        .shimmering()
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .padding()
    }

    @ViewBuilder
    private func makeLoadedStateView(for goals: [Goal]) -> some View {
        if goals.isEmpty {
            Text("No goals yet")
                .foregroundColor(.secondary)
                .italic()
        } else {
            List {
                ForEach(goals) { goal in
                    makeListElement(for: goal)
                }
            }
        }
    }

    private func makeListElement(for goal: Goal) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(goal.name).bold()
                Text(goal.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()

            Image(systemName: goal.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(goal.isCompleted ? .myAccent : .secondaryColor)
                .onTapGesture {
                    viewModel.toggleGoalCompletion(goal)
                }
        }
        .padding()

    }
}
extension View {
    func shimmering() -> some View {
        self.modifier(ShimmeringModifier())
    }
}


#Preview {
    GoalsView()
}
