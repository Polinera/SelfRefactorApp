
import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ReflectionView()
                .tabItem {
                    Label("Reflection", systemImage: "square.and.pencil")
                }
            
            InspiringView()
                .tabItem {
                    Label("Inspiring", systemImage: "quote.bubble")
                }
        }
    }
}

#Preview {
    TabBar()
}
