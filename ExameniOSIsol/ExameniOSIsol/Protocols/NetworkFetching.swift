//
//  NetworkFetching.swift
//  ExameniOSIsol
//
//  Created by Antonio Bedolla on 17/06/25.
//

import Foundation

protocol NetworkFetching {
    func fetch<T: Decodable>(url: URL) async throws -> T
}
