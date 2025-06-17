//
//  ProductRowView.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 16/06/25.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    var body: some View {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: product.skuLargeImage)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Rectangle().fill(Color.gray)
                }
                .frame(width: 80, height: 80)

                VStack(alignment: .leading) {
                    Text(product.productDisplayName)
                        .bold()
                    if product.showDiscount {
                        Text(String(format: "$%.2f", product.listPrice))
                            .strikethrough()
                            .foregroundColor(.gray)
                        Text(product.priceText)
                            .foregroundColor(.red)
                    } else {
                        Text(product.priceText)
                            .foregroundColor(.red)
                    }
                    HStack {
                        ForEach(product.colorVariants?.prefix(5) ?? [], id: \.colorHex) { color in
                            Circle()
                                .fill(Color(color.colorHex))
                                .frame(width: 12, height: 12)
                        }
                    }
                }
            }
            .padding(.vertical, 4)
        }
}

#Preview {
    let mockProduct = Product(
            productDisplayName: "Audífonos inalámbricos",
            listPrice: 1299.99,
            promoPrice: 899.99,
            skuLargeImage: "https://fakestore.com/image.jpg",
            colorVariants: [
                ColorVariant(colorHex: "#FF0000"),
                ColorVariant(colorHex: "#00FF00"),
                ColorVariant(colorHex: "#0000FF")
            ]
        )

        return ProductRowView(product: mockProduct)
            .padding()
            .previewLayout(.sizeThatFits)
}
