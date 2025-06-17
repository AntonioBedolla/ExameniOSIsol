//
//  MockProductService.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 17/06/25.
//

import Foundation

final class MockProductService: ProductService {
    override func fetchProducts(for searchTerm: String, page: Int, sortOption: String = "relevance") async throws -> [Product] {
        let url = URL(string: "https://fakeurl.com")!
        let response: ProductResponse = try await MockNetworkManager().fetch(url: url)
        return response.contents.flatMap { $0.mainContent.contents }
    }
}
