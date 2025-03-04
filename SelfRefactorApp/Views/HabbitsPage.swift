
import SwiftUI

struct HabbitsPage: View {
    var  isDataAvailable = false
    
    var body: some View {
        VStack{
        if isDataAvailable {
            Text("no habit yet")
        }
        else {
            HabbitAddingView()
        }
    }
}
}


#Preview {
    HabbitsPage()
}
