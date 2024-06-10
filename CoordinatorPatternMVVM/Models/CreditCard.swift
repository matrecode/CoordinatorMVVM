//
//  CreditCard.swift
//  CoordinatorPatternMVVM
//
//  Created by Matre Akshay Dilansing on 02/06/24.
//

import Foundation

struct CreditCardModel : Identifiable{
    var id = UUID()
    var cardNumber : String
    var cardHolderName : String
    var expiryDate : String
    var cvv : String? // Optional for security
}
