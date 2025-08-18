//
//  File.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 13.08.2025.
//

import Foundation

protocol StatisticServiceProtocol {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameResult { get }

    func store(correct count: Int, total amount: Int)
}

final class StatisticService {

}


extension StatisticService: StatisticServiceProtocol {
    var totalAccuracy: Double {
            let totalCorrectAnswers = UserDefaults.standard.integer(forKey: "totalCorrectAnswers")
            let totalQuestionsAsked = UserDefaults.standard.integer(forKey: "totalQuestionsAsked")
            
            guard totalQuestionsAsked > 0 else { return 0.0 }
            return (Double(totalCorrectAnswers) / Double(totalQuestionsAsked)) * 100
        }
        
        var gamesCount: Int {
            get {
                return UserDefaults.standard.integer(forKey: "gamesCount")
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "gamesCount")
            }
        }
        
        var bestGame: GameResult {
            get {
                let correct = UserDefaults.standard.integer(forKey: "bestGameCorrect")
                let total = UserDefaults.standard.integer(forKey: "bestGameTotal")
                let date = UserDefaults.standard.object(forKey: "bestGameDate") as? Date ?? Date()
                
                return GameResult(correct: correct, total: total, date: date)
            }
            set {
                UserDefaults.standard.set(newValue.correct, forKey: "bestGameCorrect")
                UserDefaults.standard.set(newValue.total, forKey: "bestGameTotal")
                UserDefaults.standard.set(newValue.date, forKey: "bestGameDate")
            }
        }
    func store(correct count: Int, total amount: Int) {
            gamesCount += 1
            let currentCorrect = UserDefaults.standard.integer(forKey: "totalCorrectAnswers")
            let currentTotal = UserDefaults.standard.integer(forKey: "totalQuestionsAsked")
            
            UserDefaults.standard.set(currentCorrect + count, forKey: "totalCorrectAnswers")
            UserDefaults.standard.set(currentTotal + amount, forKey: "totalQuestionsAsked")
            let currentBest = bestGame
            if count > currentBest.correct {
                bestGame = GameResult(correct: count, total: amount, date: Date())
            }
    }
    
}



