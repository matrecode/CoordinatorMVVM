//
//  HomeView.swift
//  CoordinatorPatternMVVM
//
//  Created by Matre Akshay Dilansing on 02/06/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            VStack{
                CardView()
            }.padding()
           
            TransactionsView()
        }
       
    }
}

#Preview {
    HomeView()
}
