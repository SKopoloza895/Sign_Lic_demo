//
//  QuestionView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/14.
//


import SwiftUI
//import AVFoundation
import AVKit

struct QuestionView: View {
    @EnvironmentObject var signManager: SignManager
    var videoFileName: String
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Deaf Learner's Lic")
                    .lilacText()
                
                Spacer()
                
                Text("\(signManager.index + 1) out of \(signManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: 40)
            
//          Add Video
            if let videoName = signManager.currentQuestionVideoName {
                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mp4")!))
                    .frame(height: 200)
                    .cornerRadius(10)
            }else {
                Text("Video not found")
                    .foregroundColor(.red)
            }
            
            // Add Questions
            VStack(alignment: .leading, spacing: 20) {
                Text(signManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
//                Add the selection
                ForEach(signManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(signManager)
                    
                }
                
            }
            
//            Add Button for Next Question when selection
            Button {
                signManager.goNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: signManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!signManager.answerSelected)
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        // no need show back button
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    QuestionView(videoFileName: "hello")
            .environmentObject(SignManager())
}
