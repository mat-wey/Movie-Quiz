//
//  ViewController.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 30.06.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonYNo: UIButton!
    
    @IBOutlet weak var buttonYes: UIButton!
    @IBOutlet weak var вопрос: UILabel!
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private var font = UIFont(name: "YSDisplay-Medium", size: 25)
    
    @IBOutlet weak var рейтинг: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonYes.layer.cornerRadius = 15
        buttonYNo.layer.cornerRadius = 15
        if let font = font {
            вопрос?.font = font
            рейтинг?.font = font
            count?.font = font
            
        }
    }
        
        
        
        private let index = 0
        private let questions: [QuizQuestion] = [
            QuizQuestion(
                image: "The Godfather",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "The Dark Knight",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "Kill Bill",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "The Avengers",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "Deadpool",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "The Green Knight",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: true),
            QuizQuestion(
                image: "Old",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "The Ice Age Adventures of Buck Wild",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "Tesla",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false),
            QuizQuestion(
                image: "Vivarium",
                text: "Рейтинг этого фильма больше чем 6?",
                correctAnswer: false)
        ]
        private func counter(model: QuizQuestion) -> QuizStepViewModel {
            let a = QuizStepViewModel(
                image: UIImage(
                    named: model.image) ?? UIImage(),
                question: model.text,
                questionNumber: "\(index + 1)\(questions.count)")
            return a
        }
        
        
    }
