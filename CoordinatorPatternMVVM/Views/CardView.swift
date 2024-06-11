//
//  CardView.swift
//  CoordinatorPatternMVVM
//
//  Created by Matre Akshay Dilansing on 02/06/24.
//

import SwiftUI

struct CardView: View {
    @StateObject private var creditCardVM = CreditCardViewModel()
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("Welcome Back,")
                    .font(.headline)
                    .foregroundStyle(Color.gray)
                Text("Akshay Matre")
                    .font(.system(size: 25))
                    .foregroundStyle(Color.black)
            }
            Spacer()
            ZStack {
                Image(systemName: "bell.fill")
                    .font(.headline)
                Circle()
                    .fill(Color.red)
                    .frame(width: 12, height: 12)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2) // White border
                    )
                    .offset(x: 7, y: -10) // Adjust the position of the red dot
            }
//            Image(systemName: "person.circle.fill")
//                .font(.system(size: 40))
            
            
        }
     
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.linearGradient(colors:[
                        Color(.blue),
                        Color(.systemBlue)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                    // Card Details
                VStack(alignment: .leading, spacing:10){
                    HStack{
                        Text(creditCardVM.isCvvVisible ? creditCardVM.cardNumber : "xxxx xxxx xxxx xxx")
                            .font(.headline)
                        Spacer()
                        Image("mastercard")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                    }
                    
                    HStack(spacing:12){
                        Text(creditCardVM.isCvvVisible ? creditCardVM.expiryDate : "MM/YY")
                            .font(.headline)
                        Spacer()
                        
                        Text(creditCardVM.isCvvVisible ?  creditCardVM.cvv! : "***")
                                .font(.headline)
                        Button(action: {
                            creditCardVM.toggleCvvVisibility()
                        }) {
                            Image(systemName: creditCardVM.isCvvVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 15)
                    
                    Spacer(minLength: 0)
                    
                    Text(creditCardVM.isCvvVisible ? creditCardVM.cardHolderName : "XXXXXX XXXXXX XXXXXX")
                        .padding(.bottom, 20)
                        .font(.headline)
                   
                }
                .padding(20)
                .environment(\.colorScheme, .dark)
                
        
            }
            .frame(height: 230)
        }
        
        if creditCardVM.isCvvVisible {
            Text("Car Info visible for \(creditCardVM.remainingTime) seconds")
                .font(.caption2)
                .foregroundColor(.red)
                .padding(.top, 5)
        }else{
            Text("Press eye icon to see card info")
                .font(.caption2)
                .foregroundColor(.blue)
                .padding(.top, 5)
        }

    }
}

#Preview {
    CardView()
}
