import SwiftUI

struct AdaptiveLazyStack<Content: View>: View {
    let isLandscape: Bool
    let spacing: CGFloat
    let content: () -> Content
    
    var body: some View {
        if isLandscape {
            LazyHStack(spacing: spacing, content: content)
        } else {
            LazyVStack(spacing: spacing, content: content)
        }
    }
}
