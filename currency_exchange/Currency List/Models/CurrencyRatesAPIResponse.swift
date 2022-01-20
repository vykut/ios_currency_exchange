//
//  CurrencyRatesAPIResponse.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation

struct CurrencyPairAPIResponse: Decodable {
    let rates: [CurrencyPair]
    let pairs: [CurrencyPair]
}
