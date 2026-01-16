//
//  AlertModel.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 07.08.2025.
//

import Foundation
import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)?
}
