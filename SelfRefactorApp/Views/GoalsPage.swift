
import SwiftUI

struct GoalsPage: View {
    
    var  isDataAvailable = false
    
    var body: some View {
        VStack{
            if isDataAvailable {
                Text("sfdasf")
            }
            else {
                Text("no goals yet")
            }
        }
    }
}

#Preview {
    GoalsPage()
}
