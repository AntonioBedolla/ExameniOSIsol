//
//  NetworkManager.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 16/06/25.
//

import Foundation

final class NetworkManager: NetworkFetching {
    static let shared = NetworkManager()
    private init() {}

    func fetch<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
}
