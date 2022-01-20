//
//  CurrencyListUtils.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation

actor CurrencyListUtils: CurrencyListUtilsProtocol {
    func convertCurrenciesToCellViewModels(_ currencies: [CurrencyPair]) -> [CurrencyListCellViewModel] {
        currencies.map { pair in
                .init(
                    id: "\(pair.from)/\(pair.to)",
                    to: pair.to,
                    from: pair.from,
                    rate: pair.rate != nil ? String(format: "%.2f", pair.rate!) : "N/A"
                )
        }
    }
}
