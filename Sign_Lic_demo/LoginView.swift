//
//  LoginView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/09.
//

import SwiftUI

struct LoginView: View    {
    @State private var mobileNumber = ""
    @State private var password = ""
    @State private var isForgotPasswordActive = false
    @State private var showingHome = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.red, .yellow]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(systemName: "car.2.fill")
                        .resizable()
                        .frame(width: 220, height: 220)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.bottom, 30)
                    
                    TextField("Mobile Number", text: $mobileNumber)
                        .padding()
                        .shadow(radius: 5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    TextField("Password", text: $password)
                        .padding()
                        .shadow(radius: 5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.namePhonePad)
                    
//                        .padding(10)
//                        .background(.white)
//                        .cornerRadius(20.0)
//                        .keyboardType(.alphabet)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // Handle forgot password action here
                            isForgotPasswordActive = true
                        }) {
                            Text("Forgot Password?")
                                .foregroundColor(.black)
                                .italic()
                                .padding()
                        }
                    }
                    
                    Button(action: {
                        // Handle login action here
                        if isValidLogin() {
                            // If login is successful, navigate to the next screen or perform other actions
                            // For now, I'll print a message indicating successful login
                            print("Login successful")
                            
                            showingHome = true // Activate the NavigationLink to navigate to HomeView
                        } else {
                            // If login fails, you can show an error message or take appropriate action
                            // For now, I'll print a message indicating failed login
                            print("Login failed")
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(Color.blue)
                            .cornerRadius(25)
                    }
                    
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
            .navigationTitle("Sign in")
        }
        .background(
            NavigationLink(destination: HomeView(), isActive: $showingHome) {
                EmptyView()
            }
                .hidden() // Hide the NavigationLink initially
        )
    }
    
    func isValidLogin() -> Bool {
        // This is a placeholder implementation. You should replace it with your actual authentication logic.
        let validMobileNumber = "0123456789" // Example valid mobile number
        let validPassword = "password" // Example valid password
        
        // Check if the entered mobile number and password match the valid credentials
        return mobileNumber == validMobileNumber && password == validPassword
    }
}

#Preview {
    LoginView()
}
