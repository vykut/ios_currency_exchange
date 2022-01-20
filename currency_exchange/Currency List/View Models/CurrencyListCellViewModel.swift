//
//  CurrencyListCellModel.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation

struct CurrencyListCellViewModel: Identifiable, Hashable {
    let id: String
    let to: String
    let from: String
    let rate: String
}
