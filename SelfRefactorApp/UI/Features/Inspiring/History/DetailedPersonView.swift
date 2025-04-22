import SwiftUI

struct DetailedPersonView: View {
    let person: Person
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                personImage
                personName
                personDescription
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var personImage: some View {
        Image(person.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 300)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 10)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var personName: some View {
        Text(person.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
    }
    
    private var personDescription: some View {
        Text(person.description)
            .font(.body)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
    }
}
