//
//  DecrementItemQuantityUseCase.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 03. 15..
//

import Foundation

protocol DecrementItemQuantityUseCase {
    func execute(itemId: UUID) async -> MenuItemModel?
}

class DefaultDecrementItemQuantityUseCase: DecrementItemQuantityUseCase {
    private let repository: MenuItemRepository
    
    init(repository: MenuItemRepository) {
        self.repository = repository
    }
    
    func execute(itemId: UUID) async -> MenuItemModel? {
        return await repository.decrementQuantity(itemId: itemId)
    }
}

