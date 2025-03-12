import SwiftUI

struct HomePage: View {
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    
    var body: some View {
        NavigationView {
            layout
                .onRotate { newOrientation in
                    orientation = newOrientation
            }
        }
    }
    
    @ViewBuilder
    private var layout: some View {
        if orientation.isLandscape {
            landscapeLayout
        } else {
            portraitLayout
        }
    }
    
    // todo: ask orientation.isLandscape ? landscapeLayout : portraitLayout wont work is there any other way to shorten code?
    
    private var landscapeLayout: some View {
        HStack(spacing: 16) {
            VStack{
                Spacer()
                QuoteView()
                MoodMainPage()
            }
            .frame(maxWidth: .infinity)
            
            HabitsView()
                .frame(maxWidth: .infinity)
        }
        .padding()
    }
    
    private var portraitLayout: some View {
        VStack{
            Spacer()
            QuoteView()
            MoodMainPage()
            HabitsView()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomePage()
}
