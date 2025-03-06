//
//  MoodMainPage.swift
//  SelfRefactorApp
//
//  Created by REGC on 04/03/2025.
//

import SwiftUI

struct MoodMainPage: View {
    let offset = CGSize(width: 0, height: 100)
    let text = "Top emotions"
    
    var body: some View {
        VStack {
            Text(String(localized: "Mood diary"))
            Text(text)
            
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
