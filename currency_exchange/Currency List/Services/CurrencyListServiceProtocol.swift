//
//  CurrencyListServiceProtocol.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation
import Combine

protocol CurrencyListServiceProtocol: Actor {
    func getCurrencyRatePairs() async throws -> [CurrencyPair]
}
