//
//  MockNetworkManager.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 17/06/25.
//

import Foundation

final class MockNetworkManager: NetworkFetching {
     func fetch<T: Decodable>(url: URL) async throws -> T {
        let json = """
        {
          "contents": [
            {
              "mainContent": {
                "contents": [
                  {
                    "productDisplayName": "Audífonos Bluetooth",
                    "listPrice": 1299.0,
                    "promoPrice": 899.0,
                    "skuLargeImage": "https://fakeimage.com/audifonos.jpg",
                    "colorVariants": [
                      { "colorHex": "#FF0000" },
                      { "colorHex": "#0000FF" }
                    ]
                  }
                ]
              }
            }
          ]
        }
        """

        let data = Data(json.utf8)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
