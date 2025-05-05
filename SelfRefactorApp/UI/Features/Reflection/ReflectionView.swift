import SwiftUI

struct ReflectionView: View {
    @State var name = ""
    @State var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section(header: Text("Quick Actions")) {
                    NavigationLink("🎯 Manage goals") {
                        GoalsView()
                    }

                    NavigationLink("🧠 Your mood") {
                        MoodView()
                    }

                    Button("➕ Add habit") {
                        path.append(ReflectionRoute.addHabit)
                    }
                    .foregroundColor(.accentColor)
                }

                Section {
                    Button {
                        path.append(ReflectionRoute.journal)
                    } label: {
                        HStack {
                            Image(systemName: "book.closed")
                            Text("Thought Journal")
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Reflection")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: ReflectionRoute.self) { route in
                switch route {
                case .addHabit:
                    AddHabitView(userInput: $name)
                case .goal:
                    GoalsView()
                case .mood:
                    MoodView()
                case .journal:
                    JournalView()
                }
            }
        }
    }
}


// TODO: - Skorzystaj z chatgpt / Claude AI zeby podyskutowac na temat redesignu aplikacji, on moze Ci przygotowac kod tez. Popros o uwzglednienie view modeli, zeby korzystal z MVVM

private struct NavigationCard: View {
    let title: String

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.primaryColor)
            .frame(height: 100)
            .overlay(
                Text(title)
                    .foregroundColor(.black)
                    .font(.headline)
            )

    }
}

private struct ThoughtJournalCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.secondaryColor)
            .frame(height: 100)
            .overlay(
                Text("Thought Journal")
                    .foregroundColor(.black)
                    .font(.headline)
            )
    }
}



#Preview {
    ReflectionView()
}
