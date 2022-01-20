//
//  CurrencyListRepository.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation
import Combine

actor CurrencyListRepository: CurrencyListRepositoryProtocol {
    private let baseURL: URL? = URL(string: "http://gnb.dev.airtouchmedia.com")
    private var ratesURL: URL? { baseURL?.appendingPathComponent("/rates2.json") }

    func fetchCurrencyRatePairs() async throws -> CurrencyPairAPIResponse {
        guard let url = ratesURL else {
            throw CurrencyListRepositoryError.endpointURLNotConfigured
        }

        let json: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CurrencyPairAPIResponse.self, from: json.data)
    }
}
