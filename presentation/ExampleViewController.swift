//
//  ExampleViewController.swift
//  Movie-Quiz
//
//  Created by Матвей Симонов on 10.08.2025.
//

//import UIKit
//
//final class ExampleViewController: UIViewController {
//    
//   private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 20
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "The Godfather")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    private let staticCounterLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "Вопрос:"
//        label.font = .systemFont(ofSize: 23, weight: .medium)
//        return label
//    }()
//    
//    private let counterLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "1/10"
//        label.font = .systemFont(ofSize: 23, weight: .medium)
//        label.textAlignment = .right
//        return label
//    }()
//    
//    private let question: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//      label.textAlignment = .center
//        label.textColor = .white
//        label.text = "Рейтинг этого фильма меньше чем 5? "
//        label.font = .systemFont(ofSize: 20, weight: .bold)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private lazy var topStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [staticCounterLabel, counterLabel])
//        stackView.axis = .horizontal
//        stackView.distribution = .fill
//        return stackView
//    }()
//    
//    private lazy var bottomStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [button1, button2])
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.spacing = 20
//        return stackView
//    }()
//
//    private let button1: UIButton = {
//        let button = UIButton(type:  .system)
//        button.setTitle("Нет", for: .normal)
//        button.backgroundColor = .ypWhite
//        button.layer.cornerRadius = 15
//        button.tintColor = .ypBlack
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
//        return button
//    }()
//    
//    private let button2: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Да", for: .normal)
//        button.backgroundColor = .ypWhite
//        
//        button.layer.cornerRadius = 15
//        button.tintColor = .ypBlack
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
//        return button
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .black
//        bottomStackView.spacing = 25
//        [topStackView, imageView, question, bottomStackView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview($0)
//        }
//        
//        NSLayoutConstraint.activate([
//            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
//            
//            imageView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20),
//            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 2.0/3.0),
//            question.heightAnchor.constraint(equalToConstant: 78),
//            question.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
//            question.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            question.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            bottomStackView.widthAnchor.constraint(equalToConstant: 270),
//            bottomStackView.heightAnchor.constraint(equalToConstant: 60),
//            bottomStackView.topAnchor.constraint(equalTo: question.bottomAnchor, constant: 20),
//            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//           
//            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
//        ])
//    }
//}
//
//#Preview {
//    ExampleViewController()
//}
