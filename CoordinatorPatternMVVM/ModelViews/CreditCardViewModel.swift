//
//  CreditCardViewModel.swift
//  CoordinatorPatternMVVM
//
//  Created by Matre Akshay Dilansing on 02/06/24.
//

import Foundation

class CreditCardViewModel : ObservableObject {
    @Published var cardNumber : String = ""
    @Published var cardHolderName : String = ""
    @Published var cvv : String?
    @Published var expiryDate : String = ""
    
    
    func isValid() -> Bool{
        return !cardNumber.isEmpty && !cardHolderName.isEmpty && !expiryDate.isEmpty
    }
}
