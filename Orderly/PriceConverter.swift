//
//  PriceConverter.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 02. 01..
//
import Foundation

class PriceConverter {
    static func convert(price: Double) -> String {
        String(format: "$%.2f", price)
    }
}
