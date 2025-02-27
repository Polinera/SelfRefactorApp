
import SwiftUI

struct DetailedPersonPage: View {
    let person: Person
    
    var body: some View {
        VStack(spacing:20){
            Image(person.image)
            Text(person.name)
            Text(person.description)
        }
    }
}
