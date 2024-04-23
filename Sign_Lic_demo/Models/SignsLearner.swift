//
//  SignsLearner.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/14.
//

import Foundation
import SwiftUI

struct SignsLearner: Decodable {
    var results: [Result]
    
//    var deafLearnerLicenseData: DeafLearnerLicenseData?
    
    struct Result: Decodable, Identifiable {
        var id: Int
        var category: String
        var question: String
        var correctAnswer: String
        var incorrectAnswer: [String]
        var imageName: String?
        var videoName: String // Add videoName property
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
                
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswer.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                let allAnswers = correct + incorrects
                
                return allAnswers.shuffled()
                
                
            } catch {
                print("Error setting answer: \(error)")
                return []
            }
        }
    }
}

