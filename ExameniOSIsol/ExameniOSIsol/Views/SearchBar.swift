//
//  SearchBar.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 16/06/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
            HStack {
                TextField("Buscar", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Buscar", action: onSearch)
            }
            .padding()
        }
}

#Preview {
    SearchBar(text: .constant("Zapatos"), onSearch: {
            print("Búsqueda ejecutada")
        })
        .padding()
        .previewLayout(.sizeThatFits)
}
