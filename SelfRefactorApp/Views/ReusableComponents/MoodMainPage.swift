//
//  MoodMainPage.swift
//  SelfRefactorApp
//
//  Created by REGC on 04/03/2025.
//

import SwiftUI

struct MoodMainPage: View {
    var body: some View {
        VStack {
            Text(String(localized: "Mood diary"))
            Text("Top emotions")
            
            HStack {
                MainPageEmojiView(rating: 20, total: 100, emoji: "😀")
                MainPageEmojiView(rating: 40, total: 100, emoji: "😜")
                MainPageEmojiView(rating: 75, total: 100, emoji: "🤩")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MoodMainPage()
}
