import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authCoordinator: AuthCoordinator

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding(.bottom, 40)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(5)
            }

            HStack {
                Button(action: {
                    authCoordinator.navigateToSignUp()
                }) {
                    Text("Sign Up")
                }
                Spacer()
                Button(action: {
                    authCoordinator.navigateToForGotPassword()
                }) {
                    Text("Forgot Password")
                }
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 40)
    }
}


#Preview {
    LoginView()
}
