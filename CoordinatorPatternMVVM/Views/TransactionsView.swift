//
//  MainView.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 17/05/24.
//

import SwiftUI


struct TransactionRow: View {
    var transaction: Transactions

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.name)
                
                if transaction.isSubscription {
                    Text("Subscription")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                } else {
                    Text("Income")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(transaction.type == .expense ? "-" : "+")\(transaction.amount)")
                    .foregroundColor(transaction.type == .expense ? .red : .green)
                HStack {
                    Text(transaction.date, style: .date)
                    Text(transaction.date, style: .time)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
        }
        .frame(height: 40)
    }
}

struct TransactionsView: View {
    
    let transactions  = [
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
    
    @State private var showAllTransactions = false;

    var body: some View {
        VStack(alignment: .leading){
            
        
            
            HStack{
                Text("Recent Transactions")
                    .font(.headline)
                Spacer()
                Button(action:{
                    withAnimation{showAllTransactions.toggle()}
                }){
                    Text(showAllTransactions ? "See less" : "See more")
                }
            }.padding()
            
            List{
                ForEach(showAllTransactions ? transactions : Array(transactions.prefix(3)), id: \.self) { transaction in
                    LazyVStack {
                        TransactionRow(transaction: transaction)
                       
                    }
                }
               
            }
        }
        
    }
    
}



#Preview {
    TransactionsView()
}
