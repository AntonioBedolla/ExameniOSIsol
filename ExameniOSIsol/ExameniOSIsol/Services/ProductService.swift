//
//  ProductService.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 16/06/25.
//

import Foundation

class ProductService {
    private let networkManager: NetworkFetching

        init(networkManager: NetworkFetching = NetworkManager.shared) {
            self.networkManager = networkManager
        }

        func fetchProducts(for searchTerm: String, page: Int, sortOption: String = "relevance") async throws -> [Product] {
            let encodedSearch = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let urlString = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf?page-number=\(page)&search-string=\(encodedSearch)&sort-option=\(sortOption)&force-plp=false&number-of-items-per-page=40&cleanProductName=false"

            guard let url = URL(string: urlString) else {
                throw URLError(.badURL)
            }

            let response: ProductResponse = try await networkManager.fetch(url: url)
            return response.contents.flatMap { $0.mainContent.contents }
        }
}
