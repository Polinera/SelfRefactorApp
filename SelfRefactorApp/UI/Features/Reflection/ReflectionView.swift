import SwiftUI

struct ReflectionView: View {
    @State var name = ""
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack (path: $path){
            ScrollView {
                VStack(spacing: 16) {
                    HStack{
                        NavigationCard(title: "Manage goals")
                                               .onTapGesture {
                                                   path.append(ReflectionRoute.goal)
                                               }
                        NavigationCard(title: "Your mood")
                                               .onTapGesture {
                                                   path.append(ReflectionRoute.mood)
                                               }
                        NavigationCard(title: "Add habit")
                                               .onTapGesture {
                                                   path.append(ReflectionRoute.addHabit)
                                               }
                    }
                    
                    ThoughtJournalCard()
                        .onTapGesture {path.append(ReflectionRoute.journal)
                        }
                    
                }
                
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: ReflectionRoute.self) { route in
                switch route {
                case .addHabit: AddHabitView(userInput: $name)
                case .goal:
                      GoalsView()
                case .mood:
                    MoodView()
                case .journal:
                    JournalView()
                }
            }
        }
        .environment(\.navigationPath, $path)
    }
}

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
