import SwiftUI

struct HomePage: View {
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

    var body: some View {
        NavigationStack {
            Group {
                if orientation.isLandscape {
                    landscapeLayout
                } else {
                    portraitLayout
                }
            }
            .padding()
            .navigationTitle("Home")
            .onRotate { newOrientation in
                orientation = newOrientation
            }
        }
    }

    private var landscapeLayout: some View {
        HStack(spacing: 16) {
            VStack(spacing: 16) {
                QuoteView()
                MoodMainPage()
            }
            .frame(maxWidth: .infinity)

            HabitsView()
                .frame(maxWidth: .infinity)
        }
    }

    private var portraitLayout: some View {
        Form {
            Section {
                QuoteView()
            }
            Section {
                MoodMainPage()
            }
            Section("Your habits") {
                HabitsView()
            }
        }
    }
}


#Preview {
    HomePage()
}
