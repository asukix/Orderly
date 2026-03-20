//
//  LoginValidationModel.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 01. 26..
//

protocol LoginValidationModelProtocol {
    func validate(loginData: LoginDTO) -> LoginResult
}

class LoginValidationModel: LoginValidationModelProtocol {
    private func validatePassword(password: String) -> Bool {
        password.count >= 6 &&
        password.contains(where: { $0.isNumber }) &&
        password.contains(where: { $0.isLetter })
    }
    
    private func validateUserName(username: String) -> Bool {
        username.count >= 4
    }
    
    private func validateName(name: String) -> Bool {
        name.count > 2
    }
    
    private func validateEmail(email: String) -> Bool {
        email.contains("@") &&
        email.contains(".") &&
        !email.contains(" ") &&
        email.count > 5
    }
    
    func validate(loginData: LoginDTO) -> LoginResult {
        var errorMessage: String = ""
        
        let isUsernameValid = validateUserName(username: loginData.userName)
        let isPasswordValid = validatePassword(password: loginData.password)
        let isFirstNameValid = validateName(name: loginData.firstName)
        let isLastNameValid = validateName(name: loginData.lastName)
        let isEmailValid = validateEmail(email: loginData.email)
        
        if !isUsernameValid {
            errorMessage = updatedErrorMessage(
                errorMessage: errorMessage,
                error: .invalidUserName
            )
        }
        
        if !isPasswordValid {
            errorMessage = updatedErrorMessage(
                errorMessage: errorMessage,
                error: .invalidPassword
            )
        }
        
        if !isFirstNameValid || !isLastNameValid {
            errorMessage = updatedErrorMessage(
                errorMessage: errorMessage,
                error: .invalidName
            )
        }
        
        if !isEmailValid {
            errorMessage = updatedErrorMessage(
                errorMessage: errorMessage,
                error: .invalidEmail
            )
        }
        
        if !errorMessage.isEmpty {
            return .failed(errorMessage: errorMessage)
        }
        
        return .success
    }
    
    private func updatedErrorMessage(errorMessage: String, error: LoginError) -> String {
        errorMessage + " " + (error.errorDescription ?? "")
    }
}
