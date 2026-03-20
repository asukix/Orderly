//
//  LoginViewModel.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 01. 25..
//

import Foundation
import Combine

protocol LoginViewModelProtocol {
    func login()
}

@MainActor
class LoginViewModel: ObservableObject, LoginViewModelProtocol {
    @Published var errorMessage: String? = nil
    @Published var userName: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    var onLoginSuccess: (() -> Void)?
    
    private let validationModel: LoginValidationModelProtocol
    
    init(
        validationModel: LoginValidationModelProtocol = LoginValidationModel(),
        isLoading: Bool = false,
        errorMessage: String? = nil,
        userName: String = "",
        firstName: String = "",
        lastName: String = "",
        email: String = "",
        password: String = ""
    ) {
        self.validationModel = validationModel
        self.errorMessage = errorMessage
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    func login() {
        let data = LoginDTO(
            userName: self.userName,
            firstName: self.firstName,
            lastName: self.lastName,
            email: self.email,
            password: self.password
        )
        
        let validateResult = LoginValidationModel().validate(loginData: data)
        switch validateResult {
        case .success:
            onLoginSuccess?()
        case .failed(errorMessage: let errorMessage):
            self.errorMessage = errorMessage
        }
    }
    
    var hasEmptyField: Bool {
        userName.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty
    }
}
