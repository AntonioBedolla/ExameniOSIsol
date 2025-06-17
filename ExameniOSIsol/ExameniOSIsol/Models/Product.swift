//
//  Product.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 16/06/25.
//

import Foundation

struct ProductResponse: Codable {
    let contents: [ProductWrapper]
}

struct ProductWrapper: Codable {
    let mainContent: MainContent
}

struct MainContent: Codable {
    let contents: [Product]
}

struct Product: Codable, Identifiable {
    let id = UUID()
    let productDisplayName: String
    let listPrice: Double
    let promoPrice: Double?
    let skuLargeImage: String
    let colorVariants: [ColorVariant]?

    var priceText: String {
        if let promo = promoPrice, promo < listPrice {
            return String(format: "$%.2f", promo)
        }
        return String(format: "$%.2f", listPrice)
    }

    var showDiscount: Bool {
        return promoPrice != nil && promoPrice! < listPrice
    }

    enum CodingKeys: String, CodingKey {
        case productDisplayName, listPrice, promoPrice, skuLargeImage, colorVariants
    }
}

struct ColorVariant: Codable {
    let colorHex: String
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
            return lhs.id == rhs.id
        }
}
