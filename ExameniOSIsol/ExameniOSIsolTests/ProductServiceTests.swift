//
//  ProductServiceTests.swift
//  ExameniOSIsolTests
//
//  Created by Antonio Bedolla on 16/06/25.
//

import XCTest

@testable import ExameniOSIsol

final class ProductServiceTests: XCTestCase {
    func testFetchProductsWithMock() async throws {
            let mockService = ProductService(networkManager: MockNetworkManager())

            let products = try await mockService.fetchProducts(for: "audifonos", page: 1)

            XCTAssertEqual(products.count, 1)
            XCTAssertEqual(products.first?.productDisplayName, "Audífonos Bluetooth")
            XCTAssertEqual(products.first?.promoPrice, 899.0)
            XCTAssertEqual(products.first?.colorVariants?.count, 2)
        }
}
