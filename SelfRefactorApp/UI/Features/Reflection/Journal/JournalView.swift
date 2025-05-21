import SwiftUI

struct JournalView: View {
    @StateObject var viewModel = JournalViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.entries) { entry in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(entry.title)
                            .font(.headline)
                        Text(entry.content)
                            .font(.subheadline)
                            .foregroundColor(.primaryTextColor.opacity(0.4))
                        Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.primaryTextColor.opacity(0.4))
                    }
                    .padding(.vertical, 4)
                }
                .onDelete(perform: viewModel.deleteEntry)
            }
            .navigationTitle("My Journal")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingSheet = true
                    } label: {
                        Label("New Entry", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                NewJournalEntryView { newEntry in
                    viewModel.addEntry(newEntry)
                    showingSheet = false
                }
            }
        }
    }
}

#Preview {
    JournalView()
}
