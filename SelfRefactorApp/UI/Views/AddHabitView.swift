
import SwiftUI

struct AddHabitView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        Text("add your own habit")
        TextField("Enter your habit", text: $userInput)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
        
        Text("You entered: \(userInput)")
    }
}

//todo check how to do preview with some params
