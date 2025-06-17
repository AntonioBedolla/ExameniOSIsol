//
//  ContentView.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 16/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProductListViewModel()
    var body: some View {
        
        NavigationView{
            VStack {
                SearchBar(text: $viewModel.searchTerm, onSearch: viewModel.search)
                                List {
                                    ForEach(viewModel.products) { product in
                                        ProductRowView(product: product)
                                            .onAppear {
                                                if product == viewModel.products.last {
                                                    Task { await viewModel.loadMore() }
                                                }
                                            }
                                    }
                                }
                            }
                            .navigationTitle("Productos")
            }
        }
    }

#Preview {
    ContentView()
}
