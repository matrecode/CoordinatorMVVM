import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authCoordinator: AuthCoordinator
    @StateObject private var loginVM = LoginVM()

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding(.bottom, 40)

            TextField("Email", text: $loginVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            SecureField("Password", text: $loginVM.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            if let errorMessage = loginVM.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }

            Button(action: {
                loginVM.login(authCoordinator: authCoordinator)
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
        .navigationBarBackButtonHidden(true)

    }
}


#Preview {
    LoginView()
}
