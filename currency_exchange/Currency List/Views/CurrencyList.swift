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
        ZStack {
            if viewModel.isLoading {
                spinner
            } else {
                currencyList
            }
        }
        .task(viewModel.getCurrencies)
        .alert(
            viewModel.alertTitle,
            isPresented: $viewModel.shouldShowAlert
        ) {
            Button(viewModel.alertButton, role: .cancel) { }
        }
    }

    var currencyList: some View {
        List(viewModel.cellsViewModels) { cellViewModel in
            CurrencyListCell(viewModel: cellViewModel)
                .padding(.vertical)
        }
        .listStyle(.insetGrouped)
    }

    var spinner: some View {
        VStack {
            ProgressView(viewModel.spinnerTitle)
                .progressViewStyle(.circular)
        }
    }
}

struct CurrencyList_Previews: PreviewProvider {
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
