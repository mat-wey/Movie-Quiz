//
//  ViewController.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 30.06.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var buttonYNo: UIButton!
    
    @IBOutlet weak var buttonYes: UIButton!
    @IBOutlet weak var вопрос: UILabel!
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private var font = UIFont(name: "YS Display-Medium", size: 25)
    
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
    
    
    private var correctAnswers = 0
    private var index = 0
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
    private func showAnswerResult(isCorrect: Bool) {
        if isCorrect { // 1
            correctAnswers += 1 // 2
        }
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            
            self.showNextQuestionOrResults()
        }
    }

    @IBAction func buttonNo(_ sender: Any) {
        let currentQuestion = questions[index]
        let givenAnswer = true
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    @IBAction func buttonYes(_ sender: Any) {
        let currentQuestion = questions[index]
        let givenAnswer = false
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    private func counter(model: QuizQuestion) -> QuizStepViewModel {
        let a = QuizStepViewModel(
            image: UIImage(
                named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(index + 1)\(questions.count)")
        return a
    }
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        рейтинг.text = step.question
        counterLabel.text = step.questionNumber
    }
 
    private func showNextQuestionOrResults() {
        if index == questions.count - 1 {
            let text = "Ваш результат: \(correctAnswers)/10"
                   let viewModel = QuizResultsViewModel(
                       title: "Этот раунд окончен!",
                       text: text,
                       buttonText: "Сыграть ещё раз")
                   show(quiz: viewModel)
            index = 0
        } else {
            index += 1
            let nextQuestion = questions[index]
            let viewModel = counter(model: nextQuestion)
            
            show(quiz: viewModel)
        }
        
        
            }
    private func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            self.index = 0
            self.correctAnswers = 0
            
            let firstQuestion = self.questions[self.index]
            let viewModel = self.counter(model: firstQuestion)
            self.show(quiz: viewModel)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
