//
//  CurrencyListRepository.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation
import Combine

actor CurrencyListRepository: CurrencyListRepositoryProtocol {
    private let endpointURL: URL? = URL(string: "http://gnb.dev.airtouchmedia.com/rates2.json")

    func fetchCurrencyRatePairs() async throws -> CurrencyPairAPIResponse {
        guard let url = endpointURL else {
            throw CurrencyListRepositoryError.endpointNotConfigured
        }

        let json: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CurrencyPairAPIResponse.self, from: json.data)
    }
}
