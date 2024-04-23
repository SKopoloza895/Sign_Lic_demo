//
//  Home.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/03/06.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("House", systemImage: "house.circle.fill")
                }
            
            Text("K53")
                .tabItem {
                    Label("K53", systemImage: "book.circle.fill")
                }
            
            Text("FAQ")
                .tabItem {
                    Label("FAQ", systemImage: "questionmark.circle.fill")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    HomeView()
}
