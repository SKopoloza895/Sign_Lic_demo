//
//  LoginView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/09.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State private var isForgotPasswordActive = false
    @State private var alertMessage: String = ""
    @State private var alertColor: Color = .black
    @State private var showingHome = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, .gray]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(systemName: "car.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding(.bottom, 30)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.bottom, 42)
                    
                    VStack(spacing: 16.0) {
                        InputFieldView(data: $username, title: "Username")
                        
                        InputFieldView(data: $password, title: "Password")
                        
                        Button(action: {
                            // Handle login action here
                            if isValidLogin() {
                                alertMessage = "Login successful"
                                alertColor = .green
                                showingHome = true // Activate the NavigationLink to navigate to HomeView
                            } else {
                                alertMessage = "Login failed"
                                alertColor = .red
                            }
                        }) {
                            Text("Sign In")
                                .fontWeight(.heavy)
                                .font(.title3)
                                .frame(maxWidth: 330)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                        }
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                // Handle forgot password action here
                                isForgotPasswordActive = true
                            }) {
                                Text("Forgotten Password?")
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.blue)
                                    .underline()
                            }
                        }
                        .padding(.trailing, 16)
                    }
                    
                    // Display the alert message
                    Text(alertMessage)
                        .foregroundColor(alertColor)
                        .padding()
                    
                    // Navigation to Register View
                    NavigationLink(destination: RegisterView()) {
                        Text("Do you have an account ?")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                        
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            }
            .background(
                NavigationLink(destination: HomeView(), isActive: $showingHome) {
                    EmptyView()
                }
                .hidden() // Hide the NavigationLink initially
            )
        }
    }
    
    func isValidLogin() -> Bool {
        // Replace with your actual login validation logic
        // For example, checking against hardcoded credentials
        let validUsername = "user"
        let validPassword = "password"
        
        return username == validUsername && password == validPassword
    }
}

#Preview {
    LoginView()
}
