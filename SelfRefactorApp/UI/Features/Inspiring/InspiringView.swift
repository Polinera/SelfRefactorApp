
import SwiftUI

struct InspiringView: View {
    @State var name = ""
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack (path: $path){
            VStack(spacing: 20) {
                Spacer()
                
                Text("History is one click away :)")
                    .onTapGesture {
                        path.append(InspiringRoute.addHistory)
                    }

                Text("Other inspiring things will be here")
                
                Spacer()
            }
            .navigationDestination(for: InspiringRoute.self) { route in
                switch route {
                case .addHistory:
                    HistoryView()
                }
            }
        }
    }
}

#Preview {
    InspiringView()
}
