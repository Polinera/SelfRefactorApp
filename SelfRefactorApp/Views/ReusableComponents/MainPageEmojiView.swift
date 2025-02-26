//
//  MainPageEmojiView.swift
//  SelfRefactorApp
//
//  Created by REGC on 26/02/2025.
//

import SwiftUI

struct MainPageEmojiView: View {
    let rating: Double  // e.g., 50
       let total: Double   // e.g., 100
       let emoji: String   // The emoji you want to display in the center
       
       // Compute a normalized value between 0 and 1.
       private var normalizedRating: Double {
           rating / total
       }
       
       var body: some View {
           ZStack {
               // Background circle (full circle, light gray)
               Circle()
                   .stroke(lineWidth: 10)
                   .opacity(0.3)
                   .foregroundColor(.gray)
               
               // Foreground arc representing the rating
               Circle()
                   .trim(from: 0, to: CGFloat(normalizedRating))
                   .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                   .foregroundColor(.blue)
                   .rotationEffect(Angle(degrees: -90))
               
               // Center emoji icon (or you could add a percentage text here)
               Text(emoji)
                   .font(.system(size: 50))
           }
           .frame(width: 100, height: 100)
       }
   }

   struct ContentView: View {
       var body: some View {
           // For example, display a circular gauge with 50% rating and a happy emoji
           MainPageEmojiView(rating: 50, total: 100, emoji: "😀")
       }
   }

   struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
           ContentView()
       }
   }
