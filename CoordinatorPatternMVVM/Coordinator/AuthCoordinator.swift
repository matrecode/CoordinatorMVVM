//
//  AuthCoordinator.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 17/05/24.
//

import Foundation
import SwiftUI

class AuthCoordinator : ObservableObject, AuthCoordinatorProtocol {
    
    @Published var path = NavigationPath()     
    enum Route : Hashable {
        case login
        case signup
        case forgotPassword
        case main
    }
    
    func navigateToSignIn() {
        path.append(Route.login)
    }
    
    func navigateToSignUp() {
        path.append(Route.signup)
    }
    
    func navigateToForGotPassword() {
        path.append(Route.forgotPassword)
    }
    
    func navigateToMainView() {
        path.append(Route.main)
    }
}
