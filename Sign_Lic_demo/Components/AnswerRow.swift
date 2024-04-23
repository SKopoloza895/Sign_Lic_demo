//
//  AnswerRow.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/14.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var signManager: SignManager

        var answer: Answer
        
        @State private var isSelected = false
        
        // custom color for one green is correct and red is incorrect
        var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
        var red = Color(red: 0.71, green: 0.095, blue: 0.1)
         
        var body: some View {
            HStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .font(.caption)
                
                Text(answer.text)
                    .lineLimit(1, reservesSpace: true)
                    .bold()
                
                if isSelected {
                    
                    Spacer()
                    
                    Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                        .foregroundColor(answer.isCorrect ? green : red)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(signManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
            .background(.white)
            .cornerRadius(10)
            .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
            .onTapGesture {
                if !signManager.answerSelected {
                    isSelected = true
                    signManager.selectAnswer(answer: answer)
                }
            }
            
        }
    }

#Preview {
    AnswerRow(answer: Answer(text: "Single?", isCorrect: false))
        .environmentObject(SignManager())
}
