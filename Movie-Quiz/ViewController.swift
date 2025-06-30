//
//  ViewController.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 30.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    private var array: [UIImage] = [UIImage(named: "The room")!, UIImage(named: "the lord of the rings the fellelo of the ring")!]//, UIImage(named: "Kill Bill")!, UIImage(named: "The Avengers")!, UIImage(named: "Inception")!, UIImage(named: "Mad Max: Fury Road")!, UIImage(named: "The Lion King")!, UIImage(named: "Pulp Fiction")!]
    private var index = 0
    var a = false
    @IBAction func buttonNo(_ sender: Any) {
        a = false
    }
    @IBAction func buttonYes(_ sender: Any) {
       a = true
        UIImage(named: array[0])
    }
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
  
