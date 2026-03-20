//
//  MenuItemModel.swift
//  MVVM_V1
//
//  Created by Phrakonkham Sengpraseuth on 2026. 03. 15..
//

import Foundation

// MARK: - MenuItemModel
struct MenuItemModel: Identifiable {
    let id: UUID
    let name: String
    let price: Double
    let notes: [String]
    let iconName: String
    var quantity: Int
}
