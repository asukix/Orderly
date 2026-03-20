//
//  IncrementItemQuantityUseCase.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 03. 15..
//

import Foundation

protocol IncrementItemQuantityUseCase {
    func execute(itemId: UUID) async -> MenuItemModel?
}

class DefaultIncrementItemQuantityUseCase: IncrementItemQuantityUseCase {
    private let repository: MenuItemRepository
    
    init(repository: MenuItemRepository) {
        self.repository = repository
    }
    
    func execute(itemId: UUID) async -> MenuItemModel? {
        return await repository.incrementQuantity(itemId: itemId)
    }
}
