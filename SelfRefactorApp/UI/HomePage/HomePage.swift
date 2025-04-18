import SwiftUI

struct HomePage: View {
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    @State var name = ""
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack (path: $path){
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

    private var landscapeLayout: some View {
        HStack(spacing: 16) {
            VStack(spacing: 16){
                Spacer()
                QuoteView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                MoodMainPage()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity)

            HabitsView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
