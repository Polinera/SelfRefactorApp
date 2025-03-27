
import SwiftUI

struct InspiringView: View {
    @State var name = ""
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack (path: $path){
            Text("Hello, History and other inspiring things will be here :)")
                .onTapGesture {
                    path.append(InspiringRoute.addHistory)
                }
                .navigationDestination(for: InspiringRoute.self) { route in
                    switch route {
                    case .addHistory: HistoryView()
                    }
                }
        }
        .environment(\.navigationPath, $path)
    }
}

#Preview {
    InspiringView()
}

//TODO: ask if view tree should be in separete folder? or separate features like goals, habits ect what is best practise?
