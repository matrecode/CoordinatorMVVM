//
//  AuthServices.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 17/05/24.
//

import Foundation
import FirebaseAuth

class AuthServices {
    static let shared = AuthServices()
    
    private init(){
        
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                let user = User(uid: authResult.user.uid, email: authResult.user.email!)
                completion(.success(user))
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                let user = User(uid: authResult.user.uid, email: authResult.user.email!)
                completion(.success(user))
            }
        }
    }
    
    func forgotPassword(email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { error in
            completion(error)
        })
    }
}
