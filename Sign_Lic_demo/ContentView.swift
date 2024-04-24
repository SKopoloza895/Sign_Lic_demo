//
//  ContentView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/03/06.
//

import SwiftUI

struct ContentView: View {
    @State private var showingRegister = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("bg_black") // Set your background image
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Image("signRoad")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 410, height: 200)
                        .padding()
                    
                    // nomonde check github
                    Text("Hello Siyanda")
                    
                    //Fix this: aligment
                    Text("Welcoome to App")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .font(.system(size: 19))
                    
                    // Logo image
                    Image(systemName: "car.2.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                        .foregroundColor(.white)
                    
                    // Welcome message
                    Text("Welcome to Sign_Lic App")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                    
                    // Navigation to login view
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    
                    HStack {
                        Text("Do you have an Account?")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        // Navigation to register view
                        NavigationLink(destination: RegisterView()) {
                            Text("Sign Up")
                                .font(.system(size: 12, weight: .light, design: .serif))
                                .italic()
                                .foregroundColor(.green)
                        }
//                        .sheet(isPresented: $showingRegister) {
//                            // Present the RegisterView when showingRegistration is true
//                            RegisterView()
//                        }
                    }
                }
            }
//                        .navigationTitle("Welcome")
        }
    }
}

// Placeholder function for sign up action
func signUp() {
    // Implement your sign up logic here
    print("Sign Up tapped")
}

#Preview {
    ContentView()
}
