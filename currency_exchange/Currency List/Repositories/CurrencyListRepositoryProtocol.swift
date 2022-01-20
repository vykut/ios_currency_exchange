//
//  CurrencyListRepositoryProtocol.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation
import Combine

protocol CurrencyListRepositoryProtocol: Actor {
    func fetchCurrencyRatePairs() async throws -> CurrencyPairAPIResponse
}
