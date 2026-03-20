//
//  BasketViewModel.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2025. 11. 01..
//

import Foundation
import Combine


class MenuViewModel: ObservableObject {
    @Published var items: [MenuItemModel] = []
    
    private let repository: MenuItemRepository
    private let incrementUseCase: IncrementItemQuantityUseCase
    private let decrementUseCase: DecrementItemQuantityUseCase
    private let deleteUseCase: DeleteItemUseCase

    init(
        repository: MenuItemRepository,
        incrementUseCase: IncrementItemQuantityUseCase,
        decrementUseCase: DecrementItemQuantityUseCase,
        deleteUseCase: DeleteItemUseCase
    ) {
        self.repository = repository
        self.incrementUseCase = incrementUseCase
        self.decrementUseCase = decrementUseCase
        self.deleteUseCase = deleteUseCase
        
        Task {
            await loadItems()
        }
    }
    
    // MARK: - Public Methods
    
    func loadItems() async {
        let fetchedItems = await repository.fetchAllItems()
        await MainActor.run {
            self.items = fetchedItems
        }
    }
    
    private func index(for id: UUID) -> Int? {
        items.firstIndex(where: { $0.id == id })
    }
    
    func itemTitle(id: UUID) -> String {
        guard let idx = index(for: id) else { return "Unknown Item" }
        return items[idx].name
    }
    
    func itemPrice(id: UUID) -> Double {
        guard let idx = index(for: id) else { return 0.0 }
        return items[idx].price
    }
    
    func itemPriceString(id: UUID) -> String {
        guard let idx = index(for: id) else { return "Unknown Price" }
        return String(format: "$%.2f", items[idx].price)
    }
    
    func itemOptions(id: UUID) -> [String] {
        guard let idx = index(for: id) else { return [] }
        return items[idx].notes
    }
    
    func itemQuantity(id: UUID) -> Int {
        guard let idx = index(for: id) else { return 0 }
        return items[idx].quantity
    }

    func incrementQuantity(id: UUID) {
        Task {
            if let updatedItem = await incrementUseCase.execute(itemId: id),
               let index = items.firstIndex(where: { $0.id == id }) {
                await MainActor.run {
                    items[index] = updatedItem
                }
            }
        }
    }
    
    func decrementQuantity(id: UUID) {
        Task {
            if let updatedItem = await decrementUseCase.execute(itemId: id),
               let index = items.firstIndex(where: { $0.id == id }) {
                await MainActor.run {
                    items[index] = updatedItem
                }
            }
        }
    }
    
    func deleteAction(id: UUID) {
        Task {
            let success = await deleteUseCase.execute(itemId: id)
            if success {
                await MainActor.run {
                    items.removeAll(where: { $0.id == id })
                }
            }
        }
    }

    func editAction() {
        // Implement edit logic
    }
}

