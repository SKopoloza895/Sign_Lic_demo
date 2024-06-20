import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State private var emailAddress = ""
    @State private var mobileNumber = ""
    @State private var dateOfBirth = ""
    @State private var location = ""
    @State private var showConfirmation = false
    @State private var formSubmitted = false
    @State private var isSignInActive = false
    @State private var showingHome = false
    @State private var alertMessage: String = ""
    @State private var alertColor: Color = .black
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, .gray]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Image(systemName: "car.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding(.bottom, 30)
                    
                    TextField("Username", text: $username)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(20.0)
                    
                    TextField("Email Address", text: $emailAddress)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(20.0)
                        .keyboardType(.emailAddress)
                    
                    TextField("Mobile Number", text: $mobileNumber)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(20.0)
                        .keyboardType(.phonePad)
                    
                    if showConfirmation {
                        SecureField("Password", text: $password)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20.0)
                        
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20.0)
                        
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
                        Text(alertMessage)
                            .foregroundColor(alertColor)
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .background(
            NavigationLink(destination: HomeView(), isActive: $showingHome) {
                EmptyView()
            }
                .hidden()
        )
    }
    
    func submitForm() {
        guard !username.isEmpty, !emailAddress.isEmpty, !mobileNumber.isEmpty, !dateOfBirth.isEmpty, !location.isEmpty else {
            alertMessage = "Please fill in all fields."
            alertColor = .red
            formSubmitted = true
            return
        }
        
        guard password == confirmPassword else {
            alertMessage = "Passwords do not match."
            alertColor = .red
            formSubmitted = true
            return
        }
        
        alertMessage = "Form submitted successfully!"
        alertColor = .green
        formSubmitted = true
        showingHome = true // Activate the NavigationLink to navigate to HomeView
        clearFields()
    }
    
    func clearFields() {
        username = ""
        emailAddress = ""
        mobileNumber = ""
        dateOfBirth = ""
        location = ""
        password = ""
        confirmPassword = ""
        showConfirmation = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
