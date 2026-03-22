//
//  MenuDetailView.swift
//  Orderly
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 22..
//

import SwiftUI

struct MenuDetailView: View {
    let model: MenuItemModel
    
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
                Image(systemName: model.iconName)
                    .padding(.horizontal, 10)
                
                VStack {
                    Text(model.name)
                    ForEach(model.notes, id: \.self) { note in
                        Text(note)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Price: $ \(PriceConverter.convert(price: model.price))")
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
                
            }) {
                Image(systemName: "plus.circle")
            }
            Text(model.quantity.description)
                .padding(.horizontal, 10)
            Button(action: {
                
            }) {
                Image(systemName: "minus.circle")
            }
            .padding(.trailing, 20)
            Button(action: {
                
            }) {
                Image(systemName: "trash")
            }
        }
    }
}

#Preview {
    Group {
        let modelStub = MenuItemModel(id: UUID(), name: "item name", price: 2.1, notes: ["note 1", "note 2"], iconName: "cart", quantity: 1)
        
        MenuDetailView(model: modelStub)
    }
}
