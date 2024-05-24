//
//  Transactions.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 23/05/24.
//

import Foundation


struct Transactions: Identifiable{
    
    enum TransactionType{
        case income
        case expense
    }
    
    var id = UUID()
    var name : String
    var amount : String
    var isSubscription : Bool
    var type : TransactionType
    var date : Date
}
