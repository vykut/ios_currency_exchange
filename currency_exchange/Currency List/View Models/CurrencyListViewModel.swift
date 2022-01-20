//
//  CurrencyListViewModel.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import Foundation
import Combine

@MainActor
class CurrencyListViewModel: ObservableObject {

    private var currencies: [CurrencyPair] = []
    @Published var cellsViewModels: [CurrencyListCellViewModel] = []

    private var serviceCancellable: AnyCancellable?

    private let service: CurrencyListServiceProtocol
    private let utils: CurrencyListUtilsProtocol

    init(
        service: CurrencyListServiceProtocol = CurrencyListService(),
        utils: CurrencyListUtilsProtocol = CurrencyListUtils()
    ) {
        self.service = service
        self.utils = utils
    }

    @Sendable
    func getCurrencies() async {
        do {
            currencies = try await service.getCurrencyRatePairs()
            cellsViewModels = await utils.convertCurrenciesToCellViewModels(currencies)
        } catch {
            // TODO: Handle error
        }
    }
}
