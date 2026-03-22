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
//        showLogin()
        showMenu()
    }
    
    private func showLogin(){
        let loginVm = LoginViewModel()
        
        loginVm.onLoginSuccess = { [weak self] in
            self?.showMenu()
        }
        
        let loginVC = LoginViewController(viewModel: loginVm)
        
        navigationController.setViewControllers([loginVC], animated: false)
        
    }
    
    private func showMenu(){
        let menuVM = DIContainer.shared.makeMenuViewModel(with: MenuItemModel.mockItems)
        let menuVC = MenuViewController(viewModel: menuVM)
        
        navigationController.setViewControllers([menuVC], animated: false)
    }
}
