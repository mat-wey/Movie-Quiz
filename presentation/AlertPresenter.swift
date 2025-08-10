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
            let alert = UIAlertController(
                title: result.title,
                message: result.text,
                preferredStyle: .alert
            )

            let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
                self?.delegate?.didTapOk()
            }

            alert.addAction(action)
            viewController.present(alert, animated: true)
        }
}


