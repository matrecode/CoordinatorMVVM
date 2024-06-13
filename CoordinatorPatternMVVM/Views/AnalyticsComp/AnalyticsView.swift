import SwiftUI

struct AnalyticsView: View {
    @State private var isExpandable = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Here we have some fancy text content. Could be whatever you imagine.")
                Spacer()
            }
            .padding(.bottom)
            
            Divider()
                .padding(.bottom)
            
            CollapsibleText(
                label: { Text("Collapsible") },
                content: {
                    VStack {
                        
                        Text("Could be whatever you imagine.")
                        Text("Could be whatever you imagine.")
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                }
            )
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
