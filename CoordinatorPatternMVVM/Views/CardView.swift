//
//  CardView.swift
//  CoordinatorPatternMVVM
//
//  Created by Matre Akshay Dilansing on 02/06/24.
//

import SwiftUI

struct CardView: View {
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
     
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.linearGradient(colors:[
                    Color(.blue),
                    Color(.systemBlue)
                ], startPoint: .topLeading, endPoint: .bottomTrailing))
            
                // Card Details
            VStack(alignment: .leading, spacing:10){
                HStack{
                    Text("1111 2222 3333 4444")
                        .font(.headline)
                    Spacer()
                    Image("mastercard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                }
                
                HStack(spacing:12){
                    Text("02/28")
                        .font(.headline)
                    Spacer()
                    Text("CVV")
                        .font(.headline)
                    Image(systemName: "questionmark.circle.fill")
                }
                .padding(.top, 15)
                
                Spacer(minLength: 0)
                
                Text("AKSHAY DILANSING MATRE")
                    .padding(.bottom, 20)
                    .font(.headline)
               
            }
            .padding(20)
            .environment(\.colorScheme, .dark)
            
        }
        .frame(height: 230)
    
    }
}

#Preview {
    CardView()
       
}
