
import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}



struct HabitsView: View {
    @StateObject var habitManager = HabitManager()
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                
                Text("Habits")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ScrollView(orientation == UIDeviceOrientation.landscapeLeft ? .vertical : .horizontal, showsIndicators: false) {
                    
                    ForEach(habitManager.habits) { habit in
                        HabitRowView(habit: habit)
                            .onTapGesture {
                                habitManager.toggleHabit(habit)
                            }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.horizontal)
            }
            .padding()
            .onRotate { newOrientation in
                orientation = newOrientation
            }
            
        }
    }
}


#Preview {
    HabitsView()
}
