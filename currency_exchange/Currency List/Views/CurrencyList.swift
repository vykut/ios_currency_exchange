//
//  CurrencyList.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import SwiftUI

struct CurrencyList: View {
    @StateObject private var viewModel: CurrencyListViewModel = .init()

    var body: some View {
        List(viewModel.cellsViewModels) { cellViewModel in
            CurrencyListCell(viewModel: cellViewModel)
                .padding(.vertical)
        }
        .listStyle(.insetGrouped)
        .task(viewModel.getCurrencies)
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static let viewModel: CurrencyListCellViewModel = .init(
        id: "EUR/USD",
        to: "USD",
        from: "EUR",
        rate: "1.13"
    )

    static var previews: some View {
        Group {
            preview
            preview
                .preferredColorScheme(.dark)
        }
    }

    static var preview: some View {
        CurrencyList()
    }
}
