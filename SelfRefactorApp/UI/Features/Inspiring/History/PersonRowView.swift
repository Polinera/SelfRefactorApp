
import SwiftUI

struct PersonRowView: View {
    let person: Person

    var body: some View {
        VStack {
            Image(person.image)
                .resizable()
                .frame(width: 40, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 10)

            Text(person.name)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("secondaryColor"))
        .cornerRadius(20)
    }
}
