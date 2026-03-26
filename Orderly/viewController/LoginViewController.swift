//
//  LoginViewController.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 20..
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    private var viewModel: LoginViewModel
    let titleLabel = UILabel()
    let loginButton = UIButton(type: .system)
    private var cancellables: Set<AnyCancellable> = []
    
    let userNameField = makeIputField("Username")
    let firstNameField = makeIputField("First Name")
    let lastNameField = makeIputField("Last Name")
    let emailField = makeIputField("e-mail")
    let passwordField = makeIputField("password")
    
    static func makeIputField(_ placeHolder: String) -> UITextField {
        let field = UITextField()
        field.placeholder = placeHolder
        field.borderStyle = .roundedRect
        return field
    }
    
    lazy var verticalPadding: CGFloat = {
        VCConstants.verticalPadding
    }()
    
    lazy var horizontalPadding: CGFloat = {
        VCConstants.horizontalPadding
    }()
    
    lazy var inputStack: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [
                userNameField,
                firstNameField,
                lastNameField,
                emailField,
                passwordField,
            ]
        )
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .fill
        
        return stack
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setViewDefaults()
        setupInputBindings()
    }
    
    private func setViewDefaults() {
        setTitleDefaults()
        setButtonDefaults()
        setInputStackDefaults()
        setupLoginBinding(button: loginButton)
    }
    
    private func setupInputBindings() {
        setupBinding(textField: userNameField, handler: { [weak self] text in
            self?.viewModel.userName = text
        })
        
        setupBinding(textField: firstNameField, handler: { [weak self] text in
            self?.viewModel.firstName = text
        })
        
        setupBinding(textField: lastNameField, handler: { [weak self] text in
            self?.viewModel.lastName = text
        })
        
        setupBinding(textField: emailField, handler: { [weak self] text in
            self?.viewModel.email = text
        })
        
        setupBinding(textField: passwordField, handler: { [weak self] text in
            self?.viewModel.password = text
        })
    }
    
    private func setupBinding(
        textField: UITextField,
        handler: @escaping (String) -> Void
    ) {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: textField
        )
        .compactMap { ($0.object as? UITextField)?.text }
        .sink { text in
            handler(text)
        }
        .store(in: &cancellables)
    }
    
    private func setupLoginBinding(button: UIButton) {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        viewModel.login()
    }
}

// MARK: View setups
extension LoginViewController {
    private func setTitleDefaults() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalPadding)
        ])
        
        titleLabel.text = "Login to Orderly"
        titleLabel.font = .preferredFont(forTextStyle: .headline)
    }
    
    private func setButtonDefaults() {
        view.addSubview(loginButton)
                
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalPadding)
        ])
        
        loginButton.setTitle("Login", for: .normal)
    }
    
    private func setInputStackDefaults() {
        view.addSubview(inputStack)
        
        inputStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            inputStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
            inputStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalPadding)
        ])
        
        passwordField.isSecureTextEntry = true
    }
}
