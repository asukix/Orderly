//
//  MenuDetailView.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 22..
//

import SwiftUI

struct MenuDetailsView: View {
    let vm: MenuDetailsViewModel
    
    var body: some View {
        VStack {
            Text("Menu Details")
                .font(Font.largeTitle)
            
            itemData()
            buttons()
                .padding(.trailing, 20)
        }
        Spacer()
    }
    
    private func itemData() -> some View {
        VStack {
            HStack {
                Image(systemName: vm.iconName)
                    .padding(.horizontal, 10)
                
                VStack {
                    Text(vm.name)
                    ForEach(vm.notes, id: \.self) { note in
                        Text(note)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Price: \(PriceConverter.convert(price: vm.price))")
                }
                .padding(.trailing, 10)
            }
            .padding(20)
        }
    }
    
    private func buttons() -> some View {
        HStack {
            Spacer()
            Button(action: {
                vm.decrementQuantity()
            }) {
                Image(systemName: "minus.circle")
            }
            Text(vm.quantity.description)
                .padding(.horizontal, 10)
            Button(action: {
                vm.incrementQuantity()
            }) {
                Image(systemName: "plus.circle")
            }
        }
    }
}

#Preview {
    Group {
        let modelStub = MenuItemModel(id: UUID(), name: "item name", price: 2.1, notes: ["note 1", "note 2"], iconName: "cart", quantity: 1)
        
        // Mock use cases for preview
        let incrementUseCase = MockIncrementItemQuantityUseCase()
        let decrementUseCase = MockDecrementItemQuantityUseCase()
        let deleteUseCase = MockDeleteItemUseCase()
        
        let vm = MenuDetailsViewModel(
            model: modelStub,
            incrementUseCase: incrementUseCase,
            decrementUseCase: decrementUseCase,
            deleteUseCase: deleteUseCase
        )
        
        MenuDetailsView(vm: vm)
    }
}
// MARK: - Mock Use Cases for Preview
private class MockIncrementItemQuantityUseCase: IncrementItemQuantityUseCase {
    func execute(itemId: UUID) async -> MenuItemModel? {
        return MenuItemModel(id: itemId, name: "item name", price: 2.1, notes: ["note 1", "note 2"], iconName: "cart", quantity: 2)
    }
}

private class MockDecrementItemQuantityUseCase: DecrementItemQuantityUseCase {
    func execute(itemId: UUID) async -> MenuItemModel? {
        return MenuItemModel(id: itemId, name: "item name", price: 2.1, notes: ["note 1", "note 2"], iconName: "cart", quantity: 0)
    }
}

private class MockDeleteItemUseCase: DeleteItemUseCase {
    func execute(itemId: UUID) async -> Bool {
        return true
    }
}

