import SwiftUI

struct HabitMainView: View {
    @StateObject var habitManager = HabitManager()
    
    var body: some View {
        NavigationView {
            VStack {
                HabitPagePartView()
                Text("Statistic")
                    .font(.title2)
                Spacer()
                Spacer()
                NavigationLink(destination: AddHabitView()) {
                    Text("Add New")
                        .foregroundColor(.black)
                        .padding(40)
                        .background(
                            Circle().fill(Color.myAccentColor)
                        )
                }
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                .padding()
            }
        }
    }
}

