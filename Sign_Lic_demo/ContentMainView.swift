//
//  ContentMainView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/14.
//

import SwiftUI

struct ContentMainView: View {
    @StateObject var signManager = SignManager()
    var body: some View {
//        TabView {
            NavigationView {
                VStack(spacing: 40) {
                    VStack(spacing: 20) {
                        Text("Deaf Learner's License")
                            .lilacText()
                        
                        Text("Are you ready to test your Learner's License?")
                            .foregroundColor(Color("AccentColor"))
                    }
                    NavigationLink {
                        SignLearnerView()
                            .environmentObject(SignManager())
                    } label: {
                        PrimaryButton(text: "Let's Start")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
                .navigationBarBackButtonHidden(true) // no need show back button
            }
            
//            .tabItem {
//                Image(systemName: "house")
//                Text("Home")
//            }
//            
//            Text("Account View")
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("Account")
//                    
//                }
//            
//            Text("Vehicle Type View")
//                .tabItem {
//                    Image(systemName: "car")
//                    Text("Vehicle Type")
//                }
//            
//            Text("Start Test View")
//                .tabItem {
//                    Image(systemName: "play.circle")
//                    Text("Start Test")
//                }
//            
//            Text("FAQ View")
//                .tabItem {
//                    Image(systemName: "questionmark.circle")
//                    Text("FAQ")
//                }
//        }
    }
}


#Preview {
    ContentMainView()
}
