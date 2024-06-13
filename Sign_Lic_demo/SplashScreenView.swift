//
//  SplashScreenView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/07.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack {
            Image("bg_black") // Set your background image
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all) // Ensure the image covers the whole screen
            
            if self.isActive {
                LoginView()
            } else {
//                Rectangle()
//                    .foregroundColor(Color.white)
                
                Image(systemName: "car.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
                    .foregroundColor(.white)
//
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
