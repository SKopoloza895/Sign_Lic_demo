//
//  InputFieldView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/06/13.
//

import SwiftUI

struct InputFieldView: View {
    // need to variables
    @Binding var data: String
    var title: String?
    
    var body: some View {
        ZStack {
            TextField("", text: $data)
                .padding(.horizontal, 5)
                .frame(height: 42)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)) // create a rounded rectangle
                        .stroke(Color.gray, lineWidth: 1.5)                     // and set its border color to gray with a line widht of 1
                )
            // HStack for the text
            HStack {
                Text(title ?? "Input")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(4)
                    .background(.white)
                Spacer()                  // pushing the text to the left
            }
            .padding(.leading, 8)
            .offset(CGSize(width: 0, height: -20))  // pushign the text up to overlay the border of the input field
        }
        .padding(4)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    @State static var data: String = ""
    
    static var previews: some View {
        InputFieldView(data: $data, title: "Password")
    }
}

//#Preview {
//    InputFieldView(data: $data, title: "Password")
//}
