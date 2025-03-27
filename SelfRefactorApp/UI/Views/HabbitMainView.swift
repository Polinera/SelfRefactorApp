import SwiftUI

struct HabitMainView: View {
    @StateObject var habitManager = HabitManager()
    @Environment (\.navigationPath) var navigationPath
    var body: some View {
        
        ZStack (alignment: .bottomTrailing){
            VStack {
                HabitPagePartView()
                Text("Statistic")
                    .font(.title2)
                Spacer()
            }
            
            Text("Add New")
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
