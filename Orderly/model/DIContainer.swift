//
//  DIContainer.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 03. 15..
//

import Foundation

/// Dependency Injection Container for creating ViewModels and their dependencies
class DIContainer {
    
    // MARK: - Singleton
    static let shared = DIContainer()
    
    private init() {}
    
    // MARK: - Factory Methods
    
    func makeMenuViewModel(with items: [MenuItemModel]) -> MenuViewModel {
        let repository = makeMenuItemRepository(with: items)
        let incrementUseCase = makeIncrementUseCase(repository: repository)
        let decrementUseCase = makeDecrementUseCase(repository: repository)
        let deleteUseCase = makeDeleteUseCase(repository: repository)
        
        return MenuViewModel(
            repository: repository,
            incrementUseCase: incrementUseCase,
            decrementUseCase: decrementUseCase,
            deleteUseCase: deleteUseCase
        )
    }
    
    // MARK: - Private Factory Methods
    
    private func makeMenuItemRepository(with items: [MenuItemModel]) -> MenuItemRepository {
        return LocalMenuItemRepository(items: items)
    }
    
    private func makeIncrementUseCase(repository: MenuItemRepository) -> IncrementItemQuantityUseCase {
        return DefaultIncrementItemQuantityUseCase(repository: repository)
    }
    
    private func makeDecrementUseCase(repository: MenuItemRepository) -> DecrementItemQuantityUseCase {
        return DefaultDecrementItemQuantityUseCase(repository: repository)
    }
    
    private func makeDeleteUseCase(repository: MenuItemRepository) -> DeleteItemUseCase {
        return DefaultDeleteItemUseCase(repository: repository)
    }
}
