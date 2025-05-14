import SwiftUI

struct ShimmeringModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0.6), Color.white.opacity(0.3)]), startPoint: .leading, endPoint: .trailing)
                    .mask(content) // Apply the shimmer effect to the content view
                    .rotationEffect(.degrees(70))
                    .offset(x: -200)
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: UUID())
            )
    }
}

