//
//  MainTabView.swift
//  CoordinatorPatternMVVM
//
//  Created by Hemant Rajkumar Pancheshwar on 24/05/24.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemGray
    }
    var body: some View {
        
        ZStack(alignment : .bottom){
            Color.white // Set background color of TabView to white
                .edgesIgnoringSafeArea(.all)
            TabView{
                HomeView()
                   .tabItem {
                       Image(systemName: "list.bullet")
                       Text("Home")
                   }

               AnalyticsView()
                   .tabItem {
                       Image(systemName: "chart.bar")
                       Text("Analytics")
                   }

               ProfileView()
                   .tabItem {
                       Image(systemName: "person.crop.circle")
                       Text("Profile")
                   }
            }
            
            VStack(spacing: 0) {
               Divider() // Separator line
                    .background(Color.white)
               Spacer().frame(height: 49) // Height of the tab bar items
           }
        }.navigationBarBackButtonHidden()
      
    }
}

#Preview {
    MainView()
}
