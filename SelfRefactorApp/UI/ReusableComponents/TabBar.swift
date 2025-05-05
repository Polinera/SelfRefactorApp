
import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ReflectionView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Reflection")
                }
            
            InspiringView()
                .tabItem {
                    Image(systemName: "a.book.closed.fill")
                    Text("Inspiring")
                }
        }
//        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    TabBar()
}
