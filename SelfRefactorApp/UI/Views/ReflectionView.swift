import SwiftUI

struct ReflectionView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    topNavigationLinks
                    ThoughtJournalCard()
                }
                .padding()
            }
        }
    }

    private var topNavigationLinks: some View {
        HStack(spacing: 16) {
            NavigationCard(title: "Goals", destination: GoalsView())
            NavigationCard(title: "Habits", destination: HabitMainView())
        }
    }
}

private struct NavigationCard<Destination: View>: View {
    let title: String
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
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
