//
//  SignLearnerView.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/14.
//

import SwiftUI

struct SignLearnerView: View {
    @EnvironmentObject var signManager: SignManager
    var body: some View {
        if signManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Deaf Learner's License")
                    .lilacText()
        
                //                best code
                
                ForEach(signManager.sectionTitles, id: \.self) { sectionTitle in
                    if let sectionScore = signManager.sectionScores[sectionTitle] {
                        let resultText = "\(sectionTitle): \(sectionScore.score)/\(sectionScore.total)"
                        
                        if sectionScore.score >= signManager.passingCriterias[signManager.sectionTitles.firstIndex(of: sectionTitle)!] {
                            Text("Passed \(resultText)")
                        } else {
                            Text("Failed \(resultText)")
                                .foregroundColor(.red)
                        }
                    } else {
                        Text("No score available for \(sectionTitle)")
                    }
                }
                
                Text("Total Score: \(signManager.score)/\(signManager.length)")
                
                Button {
                    Task.init {
                        await signManager.fetchDeaflearner()
                    }
                } label: {
                    PrimaryButton(text: "Test Again")
                }
        }
        .foregroundColor(Color("AccentColor"))
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView(videoFileName: "hello")
                .environmentObject(SignManager())
        }
        
    }
}

#Preview {
    SignLearnerView()
        .environmentObject(SignManager())
}
