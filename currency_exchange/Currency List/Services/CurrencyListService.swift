//
//  CurrencyListService.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation
import SwiftGraph

actor CurrencyListService: CurrencyListServiceProtocol {
    private let repository: CurrencyListRepositoryProtocol

    init(repository: CurrencyListRepositoryProtocol = CurrencyListRepository()) {
        self.repository = repository
    }

    func getCurrencyRatePairs() async throws -> [CurrencyPair] {
        let currencyAPIResponse = try await repository.fetchCurrencyRatePairs()

        let graph = getCurrencyGraph(currencyAPIResponse.rates)

        var pairs: [CurrencyPair] = []
        for var pair in currencyAPIResponse.pairs {
            pair.rate = graph.bfs(from: pair.from, to: pair.to).reduce(1.0) { $0 * $1.weight }
            pairs.append(pair)
        }

        return pairs
    }

    private func getCurrencyGraph(_ currencyPairs: [CurrencyPair]) -> WeightedUniqueElementsGraph<String, Double> {
        let graph = WeightedUniqueElementsGraph<String, Double>()
        for pair in currencyPairs {
            guard let rate = pair.rate else { continue }
            _ = graph.addVertex(pair.to)
            _ = graph.addVertex(pair.from)
            graph.addEdge(from: pair.from, to: pair.to, weight: rate, directed: true)
        }
        return graph
    }
}
