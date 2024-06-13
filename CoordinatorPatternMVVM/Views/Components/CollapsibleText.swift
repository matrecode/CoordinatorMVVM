import SwiftUI

struct CollapsibleText<Content: View>: View {
    @State private var isCollapsed: Bool = true
    let label: () -> Text
    let content: () -> Content
    
    init(label: @escaping () -> Text, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.content = content
    }
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isCollapsed.toggle()
                }
            }) {
                HStack {
                    self.label()
                    Spacer()
                    Image(systemName: self.isCollapsed ? "chevron.down" : "chevron.up")
                }
                .padding(.bottom, 1)
                .background(Color.white.opacity(0.01))
            }
            .buttonStyle(PlainButtonStyle())
            
            if !isCollapsed {
                VStack{
                    self.content()
                }
                .clipped()
                .transition(.opacity)
                .animation(.easeOut, value: isCollapsed)
            }
        }
    }
}
