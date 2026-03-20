//
//  MenuItem.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 01. 28..
//

import Foundation
import Combine

// MARK: - MenuItem
struct MenuItem: Identifiable {
    
    private(set) var itemPublisher = CurrentValueSubject<MenuItemModel?, Never>(nil)
    var model: MenuItemModel
    
    var id: UUID { model.id }
    
    init(model: inout MenuItemModel) {
        self.model = model
    }
    
    func incrementQuantity() {
        let updatedModel = MenuItemModel(
            id: self.model.id,
            name: self.model.name,
            price: self.model.price,
            notes: self.model.notes,
            iconName: self.model.iconName,
            quantity: self.model.quantity + 1
        )
        itemPublisher.send(updatedModel)
    }
    
    mutating func decrementQuantity() {
        let updatedModel = MenuItemModel(
            id: self.model.id,
            name: self.model.name,
            price: self.model.price,
            notes: self.model.notes,
            iconName: self.model.iconName,
            quantity: self.model.quantity - 1
        )
        itemPublisher.send(updatedModel)
    }
    
    mutating func emptyQuantity() {
        let updatedModel = MenuItemModel(
            id: self.model.id,
            name: self.model.name,
            price: self.model.price,
            notes: self.model.notes,
            iconName: self.model.iconName,
            quantity: 0
        )
        itemPublisher.send(updatedModel)
    }
}
