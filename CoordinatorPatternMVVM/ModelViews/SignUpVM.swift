//
//  SignUpVM.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 18/05/24.
//

import Foundation
class SignUpVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?
    
    
    
    func signUp(authCoordinator:AuthCoordinator) {
        guard password == confirmPassword else {
            self.errorMessage = "Passwords do not match"
            return
        }
        
        AuthServices.shared.signUp(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {  // Ensuring UI updates on the main thread
                switch result {
                case .success(let user):
                    print("User signed up: \(user)")
                    // Handle successful sign-up
                    authCoordinator.navigateToSignIn()
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
