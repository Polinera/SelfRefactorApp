import SwiftUI

struct HabitMainView: View {
    @Environment(\.navigationPath) var navigationPath

    @StateObject var viewModel = HabitMainViewModel()

    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            VStack {
                HabitPagePartView(habits: viewModel.habits) { habit in
                    viewModel.toggle(habit: habit)
                }
                Text("Statistic")
                    .font(.title2)
                Spacer()
            }

            Text("add_new")
                .foregroundColor(.black)
                .padding(50)
                .background(
                    Circle().fill(Color.myAccentColor)
                )
                .onTapGesture {
                    navigationPath.wrappedValue.append(ReflectionRoute.addHabit)
                }

        }

    }
}
