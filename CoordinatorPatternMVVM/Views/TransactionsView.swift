//
//  MainView.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 17/05/24.
//

import SwiftUI

struct TransactionsView: View {
    
    let transactions = [
        Transactions(name: "Dropbox Plan", amount: "$145", isSubscription: true, type: .expense, date: Date()),
        Transactions(name: "Youtube Ad.", amount: "$247", isSubscription: false, type: .income, date: Date()),
        Transactions(name: "Freelance Work", amount: "$350", isSubscription: false, type: .income, date: Date()),
        Transactions(name: "AWS Plan", amount: "$145", isSubscription: true, type: .expense, date: Date()),
        Transactions(name: "Dropbox Plan", amount: "$145", isSubscription: true, type: .expense, date: Date()),
        Transactions(name: "Youtube Ad.", amount: "$247", isSubscription: false, type: .income, date: Date()),
        Transactions(name: "Freelance Work", amount: "$350", isSubscription: false, type: .income, date: Date()),
        Transactions(name: "AWS Plan", amount: "$145", isSubscription: true, type: .expense, date: Date()),
        Transactions(name: "Dropbox Plan", amount: "$145", isSubscription: true, type: .expense, date: Date()),
        Transactions(name: "Youtube Ad.", amount: "$247", isSubscription: false, type: .income, date: Date()),
        Transactions(name: "Freelance Work", amount: "$350", isSubscription: false, type: .income, date: Date()),
        Transactions(name: "AWS Plan", amount: "$145", isSubscription: true, type: .expense, date: Date())
    ]
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Recent Transactions")
                    .font(.headline)
                Spacer()
                Button(action:{
                    
                }){
                    Text("See all")
                }
            }.padding()
            
            List(transactions){ transaction in
                HStack{
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                            
                        if(transaction.isSubscription){
                        Text("Subscription")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }else{
                            Text("Income")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    VStack(alignment:.trailing){
                        Text("\(transaction.type == .expense ? "-" : "+")\(transaction.amount)")
                            .foregroundColor(transaction.type == .expense ? .red : .green)
                        HStack {
                            Text(transaction.date, style: .date)
                            Text(transaction.date, style: .time)
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    }
                }.frame(height:50)
            }
        }
        
    }
    
}

#Preview {
    TransactionsView()
}