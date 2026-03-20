//
//  AppCoordinator.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 20..
//

import UIKit

class AppCoordinator {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        showLogin()
    }
    
    private func showLogin(){
        let loginVm = LoginViewModel()
        let loginVC = LoginViewController(viewModel: loginVm)
        
        navigationController.setViewControllers([loginVC], animated: false)
        
    }
    
    private func showMenu(){
        
    }
}
