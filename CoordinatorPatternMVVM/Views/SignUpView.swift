import SwiftUI

struct SignUpView: View {
   
    @EnvironmentObject var authCoordinator: AuthCoordinator
    @StateObject private var signUpVM = SignUpVM()
    
   

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding(.bottom, 40)

            TextField("Email", text: $signUpVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            SecureField("Password", text: $signUpVM.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)

            SecureField("Confirm Password", text: $signUpVM.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            if let errorMessage = signUpVM.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }

            Button(action: {
                signUpVM.signUp(authCoordinator: authCoordinator)
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
        .environmentObject(AuthCoordinator())
}
