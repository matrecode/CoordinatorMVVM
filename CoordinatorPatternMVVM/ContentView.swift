//
//  ContentView.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var authCoordinator = AuthCoordinator()
    
    var body: some View {
        NavigationStack(path: $authCoordinator.path){
            LoginView()
                .navigationDestination(for: AuthCoordinator.Route.self){route in
                    switch route {
                    case .login:
                        LoginView();
                    case .signup:
                        SignUpView();
                    case .forgotPassword:
                        ForgotPasswordView()
                    case .home:
                        MainView()
                    }
                    
                }
        }.environmentObject(authCoordinator)
    }
}

#Preview {
    ContentView()
}
