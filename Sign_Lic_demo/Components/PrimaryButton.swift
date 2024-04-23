//
//  PrimaryButton.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/14.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

#Preview {
    PrimaryButton(text: "Next")
}
