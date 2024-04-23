//
//  RegisterView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/09.
//

import SwiftUI

struct RegisterView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @State private var mobileNumber = ""
    @State private var dateOfBirth = ""
    @State private var location = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showConfirmation = false
    @State private var formSubmitted = false
    @State private var isSignInActive = false
    @State private var showingHome = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.red, .yellow]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Image(systemName: "car.2.fill")
                        .resizable()
                        .frame(width: 220, height: 220)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.bottom, 30)
                    
                    TextField("First Name", text: $firstName)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(20.0)
                        .keyboardType(.alphabet)
                    
                    TextField("Last Name", text: $lastName)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(20.0)
                        .keyboardType(.alphabet)
                    
                    TextField("Email Address", text: $emailAddress)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(20.0)
                        .keyboardType(.alphabet)
                    
                    TextField("Mobile Number", text: $mobileNumber)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(20.0)
                        .keyboardType(.alphabet)
                    
                    if showConfirmation {
                        SecureField("Password", text: $password)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20.0)
                            .keyboardType(.alphabet)
                        
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20.0)
                            .keyboardType(.alphabet)
                        
                    } else {
                        TextField("Date of Birth", text: $dateOfBirth)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20.0)
                            .keyboardType(.numbersAndPunctuation)
                        
                        
                        TextField("Location", text: $location)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20.0)
                            .keyboardType(.default)
                    }
                    
                    HStack {
                        Button(action: {
                            self.clearFields()
                        }) {
                            Text("Cancel")
                                .padding()
                                .frame(width: 120, height: 50)
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(15)
                        }
                        .padding()
                        
                        Button(action: {
                            if self.showConfirmation {
                                self.submitForm()
                                self.showingHome = true
                            } else {
                                self.showConfirmation = true
                            }
                        }) {
                            Text(self.showConfirmation ? "Submit" : "Next")
                                .padding()
                                .frame(width: 120, height: 50)
                                .foregroundColor(.white)
                                .background(self.showConfirmation ? Color.green : Color.blue)
                                .cornerRadius(15)
                        }
                        .padding()
                    }
                    
                    HStack {
                        Text("Already have an Account?")
                            .foregroundColor(.black)
                            .padding()
                        
                        Button(action: {
                            self.isSignInActive = true
                        }) {
                            Text("Sign in")
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .background(NavigationLink(destination: LoginView(), isActive: $isSignInActive) {
                            EmptyView()
                        })
                        
                    }
                    
                    if formSubmitted {
                        Text("Form submitted successfully!")
                            .foregroundColor(.green)
//                            .onAppear {
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                    self.showingHome = true
//                                }
//                            }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        //        .navigate(to: HomeView(), when: $showingHome)
        .background(
            NavigationLink(destination: HomeView(), isActive: $showingHome) {
                EmptyView()
            }
                .hidden()
        )
        .onChange(of: formSubmitted) { _ in
            if formSubmitted {
                showingHome = true // Activate the NavigationLink to navigate to HomeView
            }
        }
    }
    
    func submitForm() {
        self.formSubmitted = true
        self.clearFields()
    }
    
    func clearFields() {
        firstName = ""
        lastName = ""
        emailAddress = ""
        mobileNumber = ""
        dateOfBirth = ""
        location = ""
        password = ""
        confirmPassword = ""
        showConfirmation = false
    }
}


#Preview {
    RegisterView()
}
