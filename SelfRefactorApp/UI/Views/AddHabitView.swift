
import SwiftUI

struct AddHabitView: View {
    @Binding var userInput: String
    
    var body: some View {
        Text("add your own habit")
        TextField("Enter your habit", text: $userInput)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
        
        Text("You entered: \(userInput)")
    }
}

#Preview {
    AddHabitView(userInput: .constant("dfsf"))
}
