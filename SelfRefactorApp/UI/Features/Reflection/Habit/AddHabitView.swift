
import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name: String = ""

    var onSubmit: ((String) -> Void)?

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter your habit", text: $name)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .onSubmit {
                            onSubmit?(name)
                            dismiss()
                        }
                } footer: {
                    Button("Save") {
                        onSubmit?(name)
                        dismiss()
                    }
                    .buttonStyle(BorderedButtonStyle())
                }
            }
            .navigationTitle("Add your habit")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button.init(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Close")
                    }

                }
            }
        }
    }
}

#Preview {
    AddHabitView()
}
