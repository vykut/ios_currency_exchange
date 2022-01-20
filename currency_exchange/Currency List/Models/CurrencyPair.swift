//
//  CurrencyPair.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation

struct CurrencyPair: Hashable, Decodable {
    let from: String
    let to: String
    var rate: Double?
}

extension CurrencyPair {
    enum CodingKeys: String, CodingKey {
        case from
        case to
        case rate
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        from = try container.decode(String.self, forKey: .from)
        to = try container.decode(String.self, forKey: .to)
        if let rateString = try container.decodeIfPresent(String.self, forKey: .rate) {
            rate = Double(rateString)
        }
    }
}
