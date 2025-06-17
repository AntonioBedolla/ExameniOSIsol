//
//  ProductListViewModel.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 16/06/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchTerm = ""
    @Published var isLoading = false

    private let service = ProductService()
    private var page = 1
    private var hasMore = true

    func search() {
        page = 1
        hasMore = true
        products.removeAll()
        Task {
            await loadMore()
        }
    }

    func loadMore() async {
        guard !isLoading, hasMore else { return }
        isLoading = true
        do {
            let newProducts = try await service.fetchProducts(for: searchTerm, page: page)
            DispatchQueue.main.async {
                self.products += newProducts
                self.page += 1
                self.hasMore = !newProducts.isEmpty
                self.isLoading = false
            }
        } catch {
            print("Error loading products: \(error)")
            isLoading = false
        }
    }
}
