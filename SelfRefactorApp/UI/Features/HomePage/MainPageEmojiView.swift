import SwiftUI

struct MainPageEmojiView: View {
    let rating: Double
    let total: Double
    let emoji: String
    let animate: Bool
    
    @State private var pulse: Bool = false
    
    private var normalizedRating: Double {
        guard total > 0 else { return 0 }
        return min(max(rating / total, 0), 1)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.3)
                .foregroundColor(Color.primaryColor)
            
            Circle()
                .trim(from: 0, to: CGFloat(normalizedRating))
                .stroke(
                    style: StrokeStyle(lineWidth: 10, lineCap: .round)
                )
                .foregroundColor(Color.myAccentColor)
                .rotationEffect(.degrees(-90))
                .animation(animate ? .interpolatingSpring(stiffness: 120, damping: 15) : .none, value: normalizedRating)
            
            Text(emoji)
                .font(.system(size: 50))
                .scaleEffect(pulse ? 1.1 : 1.0)
                .animation(
                    animate ? .easeInOut(duration: 0.3).repeatCount(1, autoreverses: true) : .none,
                    value: pulse
                )
        }
        .frame(width: 100, height: 100)
        .padding()
        .accessibilityElement()
        .accessibilityLabel("Mood rating")
        .accessibilityValue("\(Int(normalizedRating * 100)) percent")
        .onChange(of: normalizedRating) {
            if animate {
                pulse.toggle()
            }
        }
    }
}
