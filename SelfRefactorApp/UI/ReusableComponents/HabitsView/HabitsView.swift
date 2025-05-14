import SwiftUI
import UIKit

struct HabitsView: View {
    @StateObject var viewModel = HabitsViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.habits) { habit in
                HStack {
                    Label(habit.name, systemImage: habit.isDone ? "checkmark.circle.fill" : "circle")
                        .labelStyle(.titleAndIcon)
                        .foregroundColor(habit.isDone ? .myAccent : .primary)

                    Spacer()

                    if habit.isDone {
                        Text("Done")
                            .font(.caption)
                            .foregroundColor(.myAccentColor)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.toggle(habit: habit)
                }
            }
        }
        .onAppear(perform: viewModel.getHabits)
    }
}

#Preview {
    HabitsView()
}
