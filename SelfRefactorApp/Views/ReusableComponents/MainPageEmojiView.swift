
import SwiftUI

struct MainPageEmojiView: View {
    let rating: Double
       let total: Double
       let emoji: String
    
       private var normalizedRating: Double {
           rating / total
       }
       
       var body: some View {
           ZStack {
               Circle()
                   .stroke(lineWidth: 10)
                   .opacity(0.3)
                   .foregroundColor(Color.primaryColor)
             
               Circle()
                   .trim(from: 0, to: CGFloat(normalizedRating))
                   .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                   .foregroundColor(Color.myAccentColor)
                   .rotationEffect(Angle(degrees: -90))
               
              
               Text(emoji)
                   .font(.system(size: 50))
           }
           .frame(width: 100, height: 100)
           .padding()
       }
        
   }

   struct ContentView: View {
       var body: some View { MainPageEmojiView(rating: 50, total: 100, emoji: "😀")
       }
   }

   struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
           ContentView()
       }
   }
