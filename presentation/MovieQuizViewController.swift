//
//  MovieQuizViewController.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 29.07.2025.
//

import UIKit

final class MovieQuizViewController: UIViewController, QuestionFactoryDelegate, AlertPresenterDelegate {
    func didReceiveNextQuestion(question: QuizQuestion?) {  }
    func didTapOk() {  }

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet private weak var questionTitleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var noButton: UIButton!
    @IBOutlet private weak var yesButton: UIButton!

    // MARK: Private properties
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    private let questionsAmount = 10
    private var currentQuestion: QuizQuestion?
    private var questionFactory: QuestionFactoryProtocol = QuestionFactory()
    private var alertPresenter: AlertPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
    super.viewDidLoad()
           
    yesButton.layer.cornerRadius = 20
    noButton.layer.cornerRadius = 20
    imageView.layer.cornerRadius = 20

    let factory = QuestionFactory()
    factory.setup(delegate: self)
    questionFactory = factory

         
    alertPresenter = AlertPresenter(delegate: self)
    questionFactory.requestNextQuestion()
       
       }
    
    // MARK: - Actions
    @IBAction private func actionNo(_ sender: Any) {
    // print(1)
    guard let currentQuestion = currentQuestion else { return }
    let isCorrect = (false == currentQuestion.correctAnswer)
    if isCorrect { correctAnswers += 1 }

    showAnswerResult(isCorrect: isCorrect)
    }

    @IBAction private func actionYes(_ sender: Any) {
    guard let currentQuestion = currentQuestion else { return }
    let isCorrect = (true == currentQuestion.correctAnswer)
    if isCorrect { correctAnswers += 1 }
    showAnswerResult(isCorrect: isCorrect)
    }

    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.borderWidth = 20
        imageView.layer.borderColor = isCorrect ? UIColor.systemGreen.cgColor : UIColor.systemRed.cgColor

        yesButton.isEnabled = false
        noButton.isEnabled = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.imageView.layer.borderWidth = 0
            self.showNextQuestionOrResults()
        }
    }

    private func convert(model: QuizQuestion) -> QuizStepViewModel {
    QuizStepViewModel(
    image: UIImage(named: model.image) ?? UIImage(),
    question: model.text,
    questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)"
    )
    }

    private func show(quiz step: QuizStepViewModel) {
    imageView.image = step.image
    questionTitleLabel.text = step.question
    indexLabel.text = step.questionNumber
        
    yesButton.isEnabled = true
    noButton.isEnabled = true
    }
    private func showNextQuestionOrResults() {
    if currentQuestionIndex == questionsAmount - 1 {
    let result = QuizResultsViewModel(
    title: "Игра окончена",
    text: "Вы ответили на \(correctAnswers) из \(questionsAmount)",
    buttonText: "Сыграть ещё раз")
    alertPresenter?.show(quiz: result, in: self)
    } else {
    currentQuestionIndex += 1
    questionFactory.requestNextQuestion()
    }
    }
    }
