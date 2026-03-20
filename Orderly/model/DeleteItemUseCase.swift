//
//  DeleteItemUseCase.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 03. 15..
//

import Foundation

protocol DeleteItemUseCase {
    func execute(itemId: UUID) async -> Bool
}

class DefaultDeleteItemUseCase: DeleteItemUseCase {
    private let repository: MenuItemRepository
    
    init(repository: MenuItemRepository) {
        self.repository = repository
    }
    
    func execute(itemId: UUID) async -> Bool {
        return await repository.deleteItem(itemId: itemId)
    }
}
