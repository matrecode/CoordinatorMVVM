import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject private var forgotPasswordVM = ForgotPasswordVM()

    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.largeTitle)
                .padding(.bottom, 40)

            TextField("Email", text: $forgotPasswordVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            if let errorMessage = forgotPasswordVM.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }

            Button(action: {
                forgotPasswordVM.sendResetPassword()
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
