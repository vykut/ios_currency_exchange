//
//  CurrencyListUtilsProtocol.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation

protocol CurrencyListUtilsProtocol: Actor {
    func convertCurrenciesToCellViewModels(_ currencies: [CurrencyPair]) -> [CurrencyListCellViewModel]
}
