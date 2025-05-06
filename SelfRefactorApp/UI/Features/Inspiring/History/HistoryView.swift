
import SwiftUI

struct HistoryView: View {
    @Environment(\.navigationPath) var navigationPath
    
    @StateObject var viewModel = HistoryViewModel()

    var body: some View {
        List {
            ForEach(viewModel.filteredPeople) { person in
                PersonRowView(person: person)
                    .onTapGesture {
                        navigationPath.wrappedValue.append(InspiringRoute.detailedPerson(person))
                    }
            }
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    HistoryView()
}
