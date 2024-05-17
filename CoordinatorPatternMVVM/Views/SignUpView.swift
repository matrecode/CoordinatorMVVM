import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject var authCoordinator: AuthCoordinator

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding(.bottom, 40)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            Button(action: {
                // Handle sign-up action
            }) {
                Text("Sign Up")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    SignUpView()
}
