//
//  MenuDetailsViewModel.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 23..
//

import Foundation
import Combine

class MenuDetailsViewModel: ObservableObject {
    var model: MenuItemModel
    var name: String { model.name }
    var price: Double { model.price }
    var notes: [String] {model.notes }
    var iconName: String { model.iconName }
    @Published var quantity: Int
    
    private let incrementUseCase: IncrementItemQuantityUseCase
    private let decrementUseCase: DecrementItemQuantityUseCase
    
    init(
        model: MenuItemModel,
        incrementUseCase: IncrementItemQuantityUseCase,
        decrementUseCase: DecrementItemQuantityUseCase
    ) {
        self.model = model
        self.quantity = model.quantity
        
        self.incrementUseCase = incrementUseCase
        self.decrementUseCase = decrementUseCase
    }
    
    @MainActor
    func incrementQuantity() {
        Task {
            if let updatedItem = await incrementUseCase.execute(itemId: model.id),
               self.quantity != updatedItem.quantity {
                self.quantity = updatedItem.quantity
            }
        }
    }
    
    @MainActor
    func decrementQuantity() {
        Task {
            if let updatedItem = await decrementUseCase.execute(itemId: model.id),
               self.quantity != updatedItem.quantity {
                self.quantity = updatedItem.quantity
            }
        }
    }
}
