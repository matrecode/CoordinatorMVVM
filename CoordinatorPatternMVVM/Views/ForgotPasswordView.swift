import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""

    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.largeTitle)
                .padding(.bottom, 40)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            Button(action: {
                // Handle forgot password action
            }) {
                Text("Reset Password")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 40)
    }
}


#Preview {
    ForgotPasswordView()
}
