import SwiftUI

struct NewJournalEntryView: View {
    @State private var title = ""
    @State private var content = ""
    
    let onSave: (Journal) -> Void

    var body: some View {
            NavigationView {
                Form {
                Section(header: Text("Title")) {
                    TextField("Entry title", text: $title)
                }

                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(height: 200)
                }
            }
            .navigationTitle("New Entry")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let entry = Journal(title: title, content: content, date: Date())
                        onSave(entry)
                    }
                    .disabled(title.isEmpty || content.isEmpty)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onSave(
                            Journal(title: "", content: "", date: Date())
                        )
                    }
                }
            }
        }
    }
}
