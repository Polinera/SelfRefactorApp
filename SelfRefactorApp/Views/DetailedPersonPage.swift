
import SwiftUI

struct DetailedPersonPage: View {
    let person: Person
    
    var body: some View {
        VStack(spacing:20){
            Image(person.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 10)
            Text(person.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text(person.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
        }
        .padding()
    }
}
