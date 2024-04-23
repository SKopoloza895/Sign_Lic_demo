//
//  OnboardingView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/09.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            TabView {
                OnboardingPageView(imageName: "figure.mixed.cardio",
                                   title: "Welcome",
                                   description: "Welcome to MyApp! Get started by exploring our amazing features.")

                OnboardingPageView(imageName: "figure.archery",
                                   title: "Discover",
                                   description: "Discover new content and stay up-to-date with the latest news and updates.")

                OnboardingPageView(imageName: "figure.yoga",
                                   title: "Connect",
                                   description: "Connect with friends and share your experiences with the community.")
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            
            // Navigation to login and register views
            NavigationLink(destination: LoginView()) {
                Text("Log In")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            
            NavigationLink(destination: RegisterView()) {
                Text("Register")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    OnboardingView()
}

struct OnboardingPageView: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text(title)
                .font(.title)
                .padding()
            
            Text(description)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
