import SwiftUI

struct MoodPickerView: View {
    @Environment(\.dismiss) var dismiss
    
    let onSelect: (MoodType) -> Void

    var body: some View {
        NavigationStack {
            List(MoodType.allCases, id: \.self) { mood in
                Button {
                    onSelect(mood)
                } label: {
                    HStack {
                        Text(mood.emoji)
                        Text(mood.label)
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.primaryTextColor)
                }
            }
            .navigationTitle("Pick your mood")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
            }
        }
    }
}

