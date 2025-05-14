import SwiftUI

struct ReflectionView: View {
   @StateObject var viewModel = ReflectionViewModel()

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
                       viewModel.isShowingAddHabit = true
                   }
                   .foregroundColor(.black)
               }

               Section {
                   Button {
                       path.append(ReflectionRoute.journal)
                   } label: {
                       HStack {
                           Image(systemName: "book.closed")
                           Text("Thought Journal")
                               .foregroundColor(.black)
                       }
                   }
               }
           }
           .listStyle(.insetGrouped)
           .navigationTitle("Reflection")
           .navigationBarTitleDisplayMode(.inline)
           .navigationDestination(for: ReflectionRoute.self) { route in
               switch route {
               case .goal:
                   GoalsView()
               case .mood:
                   MoodView()
               case .journal:
                   JournalView()
               }
           }
           .sheet(isPresented: $viewModel.isShowingAddHabit) {
               AddHabitView { name in
                   viewModel.addHabit(with: name)
               }
           }
       }
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
                   .font(.headline)
           )
   }
}



#Preview {
   ReflectionView()
}
