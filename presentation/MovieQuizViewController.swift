//
//  MovieQuizViewController.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 29.07.2025.
//

import UIKit

final class MovieQuizViewController: UIViewController, QuestionFactoryDelegate, AlertPresenterDelegate {
 
    // MARK: - QuestionFactoryDelegate
    
    func didTapOk() {
       
    }

    
    func didReceiveNextQuestion(question: QuizQuestion?) {
        guard let question = question else {
            return
        }

        currentQuestion = question
        let viewModel = convert(model: question)
        
        DispatchQueue.main.async { [weak self] in
            self?.show(quiz: viewModel)
        }
    }
    // MARK: - IB Outlets
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var no: UIButton!
    @IBOutlet weak var yes: UIButton!
    // MARK: - Private Properties
    
    private var currentQuestionIndex  = 0
    private var correctAnswers = 0
    private let font = UIFont(name: "YSDisplay-Medium", size: 20)
    private let questionsAmount: Int = 10
    private var questionFactory: QuestionFactoryProtocol = QuestionFactory()
    private var currentQuestion: QuizQuestion?
   
    override func viewDidLoad() {
           super.viewDidLoad()

           let questionFactory = QuestionFactory()
        questionFactory.setup(delegate: self)
           self.questionFactory = questionFactory
       
       
        if let firstQuestion = questionFactory.requestNextQuestion() {
            no.layer.cornerRadius = 20
            yes.layer.cornerRadius = 20
            no.isHidden = true
            yes.isHidden = true
            
        }
       
    }
    
    // MARK: - IB Actions
    
    @IBAction func actionNo(_ sender: Any) {
        guard let currentQuestion = currentQuestion else {
            return
        }
        let givenAnswer = false
        
        shownswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer) // 3
        yes.isHidden = false
        no.isHidden = false
        yes.titleLabel?.textColor = .white
    }
    
    @IBAction func actionYes(_ sender: Any) {
        guard let currentQuestion = currentQuestion else {
            return
        }
        let givenAnswer = true
        
        shownswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer) // 3
        yes.isHidden = false
        no.isHidden = false
        yes.titleLabel?.textColor = .white
    }
    
    // MARK: - Public Methods
    
    func shownswerResult(isCorrect: Bool){
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showNextQuestionOrResults()
        }
    }
    
    // MARK: - Private Methods
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let a = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
        return a
    }
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        questionTitleLabel.text = step.question
        indexLabel.text = step.questionNumber
    }
    
    private func showNextQuestionOrResults() {
        
        if currentQuestionIndex == questionsAmount - 1 {
            let text = correctAnswers == questionsAmount ?
                    "Поздравляем, вы ответили на 10 из 10!" :
                    "Вы ответили на \(correctAnswers) из 10, попробуйте ещё раз!"
        
        } else {
            if let nextQuestion = questionFactory.requestNextQuestion(){
                currentQuestion = nextQuestion
                let viewModel = convert(model: nextQuestion)

                show(quiz: viewModel)
            }
        }
    }
    

}
















//    private func show(quiz result: QuizResultsViewModel) {
//        let alert = UIAlertController(
//            title: result.title,
//            message: result.text,
//            preferredStyle: .alert)
//
//        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
//            self.currentQuestionIndex = 0
//            self.correctAnswers = 0
//
//            if let firstQuestion = self.questionFactory.requestNextQuestion() {
//                self.currentQuestion = firstQuestion
//                let viewModel = self.convert(model: firstQuestion)
//
//                self.show(quiz: viewModel)
//            }
//        }
//
//        alert.addAction(action)
//
//        self.present(alert, animated: true, completion: nil)
//        yes.isHidden = true
//        no.isHidden = true
//        yes.backgroundColor = .gray
//        no.backgroundColor = .gray
//
//    }
