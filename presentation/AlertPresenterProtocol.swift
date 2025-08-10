//
//  AlertPresenterProtocol.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 07.08.2025.
//

import Foundation
import UIKit

protocol AlertPresenterProtocol: AnyObject {
    func show(quiz result: QuizResultsViewModel, in viewController: UIViewController)
}

