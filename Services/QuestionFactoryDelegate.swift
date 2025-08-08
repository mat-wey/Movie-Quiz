//
//  QuestionFactoryDelegate.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 03.08.2025.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               // 1
    func didReceiveNextQuestion(question: QuizQuestion?)    // 2
}
