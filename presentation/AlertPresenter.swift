//
//  AlertPresenter.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 07.08.2025.
//

// Presenters/AlertPresenter.swift
import UIKit

 class AlertPresenter: AlertPresenterProtocol {
    private weak var delegate: AlertPresenterDelegate?
    
    init(delegate: AlertPresenterDelegate? = nil) {
        self.delegate = delegate
    }
    
     func show(quiz result: QuizResultsViewModel, in viewController: UIViewController) {
         let statisticService = StatisticService()
         let bestGame = statisticService.bestGame

         let message = """
         Ваш лучший результат:
         Правильные ответы: \(bestGame.correct)
         Всего вопросов: \(bestGame.total)
         Точность: \(Int((Double(bestGame.correct) / Double(bestGame.total)) * 100))%
         """

         let alert = UIAlertController(
             title: result.title,
             message: message,
             preferredStyle: .alert
         )

         let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
             self?.delegate?.didTapOk()
         }

         alert.addAction(action)
         viewController.present(alert, animated: true)
     }
        }



