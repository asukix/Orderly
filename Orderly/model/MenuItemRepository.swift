//
//  MenuItemRepository.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 03. 15..
//

import Foundation

protocol MenuItemRepository {
    func fetchAllItems() async -> [MenuItemModel]
    func incrementQuantity(itemId: UUID) async -> MenuItemModel?
    func decrementQuantity(itemId: UUID) async -> MenuItemModel?
    func deleteItem(itemId: UUID) async -> Bool
}

class LocalMenuItemRepository: MenuItemRepository {
    private var items: [MenuItemModel]
    
    init(items: [MenuItemModel]) {
        self.items = items
    }
    
    func fetchAllItems() async -> [MenuItemModel] {
        return items
    }
    
    func incrementQuantity(itemId: UUID) async -> MenuItemModel? {
        guard let index = items.firstIndex(where: { $0.id == itemId }) else {
            return nil
        }
        
        let currentItem = items[index]
        let updatedItem = MenuItemModel(
            id: currentItem.id,
            name: currentItem.name,
            price: currentItem.price,
            notes: currentItem.notes,
            iconName: currentItem.iconName,
            quantity: currentItem.quantity + 1
        )
        
        items[index] = updatedItem
        // TODO: Save to DB (Core Data, Swift Data, etc.)
        
        return updatedItem
    }
    
    func decrementQuantity(itemId: UUID) async -> MenuItemModel? {
        guard let index = items.firstIndex(where: { $0.id == itemId }) else {
            return nil
        }
        
        let currentItem = items[index]
        guard currentItem.quantity > 0 else {
            return currentItem
        }
        
        let updatedItem = MenuItemModel(
            id: currentItem.id,
            name: currentItem.name,
            price: currentItem.price,
            notes: currentItem.notes,
            iconName: currentItem.iconName,
            quantity: currentItem.quantity - 1
        )
        
        items[index] = updatedItem
        // TODO: Save to DB
        
        return updatedItem
    }
    
    func deleteItem(itemId: UUID) async -> Bool {
        guard let index = items.firstIndex(where: { $0.id == itemId }) else {
            return false
        }
        
        items.remove(at: index)
        // TODO: Delete from DB
        
        return true
    }
}
