//
//  MockBasketItems.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 01. 29..
//

import Foundation

extension MenuItemModel {
    static let mockItems: [MenuItemModel] = [
        MenuItemModel(
            id: UUID(),
            name: "Pizza Margherita",
            price: 12.99,
            notes: ["Extra basil", "No olives"],
            iconName: "food.pizza",
            quantity: 2
        ),
        MenuItemModel(
            id: UUID(),
            name:  "Caesar Salad",
            price: 8.49,
            notes: ["Dressing on the side"],
            iconName: "food.badge.salad",
            quantity: 1
        ),
        MenuItemModel(
            id: UUID(),
            name: "Bitang Joe Burger",
            price: 9.99,
            notes: ["Onion", "Lettuce", "Tomato"],
            iconName: "food.burger",
            quantity: 4
        )
    ]
}
