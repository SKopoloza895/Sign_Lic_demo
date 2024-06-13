//
//  LoginView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/09.
//

import SwiftUI

struct LoginView: View    {
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
                        .frame(width: 220, height: 220)
                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.bottom, 30)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.bottom, 42)
                    
                    VStack(spacing: 16.0) {
                        InputFieldView(data: $username, title: "Username")
                        
                        InputFieldView(data: $password, title: "Password")
                    }
                    Button(action: {
                        // Handle login action here
                        if isValidLogin() {
                            // If login is successful, navigate to the next screen or perform other actions
                            // For now, I'll print a message indicating successful login
                            alertMessage = "Login successful"
                            alertColor = .green
//                            print("Login successful")
                            
                            showingHome = true // Activate the NavigationLink to navigate to HomeView
                        } else {
                            // If login fails, update the alert message and color
                            alertMessage = "Login failed"
                            alertColor = .red
                            // For now, I'll print a message indicating failed login
                            print("Login failed")
                        }
                    }) {
                        Text("Sign In")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                    }
                    // Display the alert message
                    Text(alertMessage)
                        .foregroundColor(alertColor)
                        .padding()
                    
//                  Add Forget password
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
                    .padding(.top, 16)
                    
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
//            .navigationTitle("Sign in")
        }
        .background(
            NavigationLink(destination: HomeView(), isActive: $showingHome) {
                EmptyView()
            }
                .hidden() // Hide the NavigationLink initially
        )
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
