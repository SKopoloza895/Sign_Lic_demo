//
//  SignManager.swift
//  Sign_Lic_demo
//
//  Created by Siyanda Kopolo on 2024/04/14.
//

import Foundation
import SwiftUI

enum Category: String {
    case roadRules = "Road Rules"
    case roadSigns = "Road Signs"
    case vehicleControls = "Vehicle Controls"
}

class SignManager: ObservableObject {
    
    private(set) var deafLearner: [SignsLearner.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    @Published var passingCriterias: [Int] = [22, 23, 6]

//    @Published private(set) var deafLearnerLicenseData: DeafLearnerLicenseData?

    
    @Published private(set) var sectionScores: [String: (score: Int, total: Int)] = [:]
    
    private let sectionCounts = [28, 28, 8] // Number of questions in each section
    // Passing criteria for each section
//    public let passingCriterias: [Int] = [22, 23, 6]
    
//    private let sectionTitles = ["Road Rules", "Road Signs", "Vehicle Controls"] // Section titles
//    public let sectionTitles = ["Road Rules", "Road Signs", "Vehicle Controls"] // Section titles
    public let sectionTitles = [Category.roadRules.rawValue, Category.roadSigns.rawValue, Category.vehicleControls.rawValue] // Section titles

    @Published private(set) var currentCategory: Category? = nil
    
    var currentQuestionVideoName: String? {
            guard index < deafLearner.count else { return nil }
            return deafLearner[index].videoName
        }
    

    
    init() {
        Task.init{
//            loadDeafLearnerData()
           await fetchDeaflearner()
        }
    }
    
    func fetchDeaflearner(for category: Category? = nil) async {
        //      json file on bundle
        if let jsonURL = Bundle.main.url(forResource: "deafLearnerLicenceData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: jsonURL)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decodedData = try decoder.decode(SignsLearner.self, from: data)
                
                // Dispatch UI updates to the main thread
                DispatchQueue.main.async {
                    //reset to start test again
                    self.index = 0
                    self.score = 0
                    self.progress = 0.00
                    self.reachedEnd = false
                    

                    self.deafLearner = decodedData.results.filter { result in
                        if let resultCategory = Category(rawValue: result.category) {
                            return category == nil || resultCategory == category
                        }
                        return false
                    }
                    
                    self.deafLearner = decodedData.results
//                    self.deafLearnerLicenseData = decodedData.deafLearnerLicenseData
                    
                    self.length = self.deafLearner.count
                    self.setQuestion(for: category)
                }
            } catch {
                print("Error loading deafLearnerLicence data: \(error)")
            }
        } else {
            fatalError("deafLearnerLicenceData.json not found in the app bundle.")
        }
        
    }

//    API on Website
//    func fetchDeaflearner() async {
//        guard let url = URL(string: "") else { fatalError("Missing URL") }
//
//        let urlRequest = URLRequest(url: url)
//
//        do {
//            let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error all fetching data")}
//
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let decodedData = try decoder.decode(DeafLearner.self, from: data)
//
//            DispatchQueue.main.async {
//                self.deafLearner = decodedData.results
//                self.length = self.deafLearner.count
//                self.setQuestion()
//            }
//
//        } catch {
//            print("Error fetching DeafLearner: \(error)")
//        }
//    }
    
    func goNextQuestion() {
        if index + 1 < length {
             index += 1
            
            setQuestion()
            
        } else {
            reachedEnd = true
            checkPassingCriteria()
        }
    }
    
    func setQuestion(for category: Category? = nil) {
        // Dispatch UI updates to the main thread
        DispatchQueue.main.async {
            self.answerSelected = false
            self.progress = CGFloat(Double(self.index + 1) / Double(self.length) * 350)
            
            if self.index < self.length {
                let currentDeaflearnerQuestion = self.deafLearner[self.index]
                self.question = currentDeaflearnerQuestion.formattedQuestion
                self.answerChoices = currentDeaflearnerQuestion.answers
            }
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
//    code from orginal
    
//    private func checkPassingCriteria() {
//        var totalScore = 0
//        var totalQuestions = 0
//
//        for (index, sectionCount) in sectionCounts.enumerated() {
//            let startIndex = index * sectionCount
//            let endIndex = startIndex + sectionCount
//            let sectionScore = scoreInRange(startIndex..<endIndex)
//
//            totalScore += sectionScore
//            totalQuestions += sectionCount
//
//            let sectionTitle = sectionTitles[index]
//            let passingCriteria = self.passingCriterias[index]
//            print("\(sectionTitle): \(sectionScore)/\(sectionCount)")
//
//            // You can also update the sectionScores dictionary if needed
//            sectionScores[sectionTitle] = (sectionScore, sectionCount)
//        }
//
//        print("Total Score: \(totalScore)/\(totalQuestions)")
//    }

//    from the bot
    private func checkPassingCriteria() {
        var totalScore = 0
        var totalQuestions = 0

        for (index, sectionCount) in sectionCounts.enumerated() {
            let startIndex = index * sectionCount
            let endIndex = startIndex + sectionCount
            let sectionScore = scoreInRange(startIndex..<endIndex)

            let sectionTitle = sectionTitles[index]
            
            // Check if the current section title should be excluded
            if !shouldExcludeSection(sectionTitle) {
                totalScore += sectionScore
                totalQuestions += sectionCount
            }

            print("\(sectionTitle): \(sectionScore)/\(sectionCount)")
            
            // You can also update the sectionScores dictionary if needed
            sectionScores[sectionTitle] = (sectionScore, sectionCount)
        }

        print("Total Score: \(totalScore)/\(totalQuestions)")
    }

    // Function to check if a section should be excluded from the total
    private func shouldExcludeSection(_ sectionTitle: String) -> Bool {
        let excludedSections = ["Sign", "Rule road", "Control"]
        return excludedSections.contains(sectionTitle)
    }
    
    
    func didPassTest() -> Bool {
        // Check passing criteria for each section
        for (index, sectionCount) in sectionCounts.enumerated() {
            let startIndex = index * sectionCount
            let endIndex = startIndex + sectionCount
            let sectionScore = scoreInRange(startIndex..<endIndex)

            if sectionScore < passingCriterias[index] {
                return false // User failed in at least one section
            }
        }

        return true // User passed all sections
    }

    private func scoreInRange(_ range: Range<Int>) -> Int {
        let validRange = range.clamped(to: 0..<length)
        return validRange.map { answerIndex in
            deafLearner[answerIndex].answers.first(where: { $0.isCorrect }) != nil ? 1 : 0
        }.reduce(0, +)
    }
}
