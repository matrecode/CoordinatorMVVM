//
//  LoginVM.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 18/05/24.
// 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

import Foundation

class LoginVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    func login(authCoordinator: AuthCoordinator) {
        AuthServices.shared.login(email: email, password: password) { result in
            switch result {
            case .success(let user):
                print("User logged in: \(user)")
                authCoordinator.navigateToMainView()
                
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
