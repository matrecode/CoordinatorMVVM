//
//  ForgotPasswordVM.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 18/05/24.
//

import Foundation

class ForgotPasswordVM: ObservableObject {
    @Published var email: String = ""
    @Published var errorMessage: String?
    @Published var successMessage: String?
    
    func sendResetPassword() {
        AuthServices.shared.forgotPassword(email: email) { error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.successMessage = "Password reset email sent"
            }
        }
    }
}
