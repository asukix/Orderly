//
//  LoginViewController.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 20..
//

import UIKit

class LoginViewController: UIViewController {
    private var viewModel: LoginViewModel
    let titleLabel = UILabel()
    let loginButton = UIButton(type: .system)
    let verticalPadding: CGFloat = 24
    
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
    }
    
    private func setViewDefaults() {
        setTitleDefaults()
        setButtonDefaults()
    }
    
}

// MARK: View setups
extension LoginViewController {
    private func setTitleDefaults() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalPadding).isActive = true
        titleLabel.text = "Login to Orderly"
    }
    
    private func setButtonDefaults() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalPadding).isActive = true
        loginButton.setTitle("Login", for: .normal)
    }
}
