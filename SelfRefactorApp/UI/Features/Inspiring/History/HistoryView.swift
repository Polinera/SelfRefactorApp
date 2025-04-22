
import SwiftUI

struct HistoryView: View {
    @StateObject var model = PeopleViewModel()
   
    var column = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
                    List {
                        ForEach(model.allPeople) { person in
                            NavigationLink(destination: DetailedPersonView(person: person)) {
                                PersonRowView(person: person)
                            }
                        }
                    }
                    .searchable(text: $model.searchText)
                }
            }
        }

#Preview {
    HistoryView()
}
