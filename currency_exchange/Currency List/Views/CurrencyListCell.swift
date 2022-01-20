//
//  CurrencyListCell.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import SwiftUI

struct CurrencyListCell: View {
    let viewModel: CurrencyListCellViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                toFromLabel(title: "From", value: viewModel.from)
                toFromLabel(title: "To", value: viewModel.to)
            }
            Spacer()
            rateLabel
        }
    }

    func toFromLabel(title: String, value: String) -> some View {
        Text("\(title): ")
        +
        Text(value)
            .fontWeight(.medium)
    }

    var rateLabel: some View {
        Text(viewModel.rate)
            .font(.largeTitle)
    }
}

struct CurrencyListCell_Previews: PreviewProvider {
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
        .padding()
        .previewLayout(.sizeThatFits)
    }

    static var preview: some View {
        CurrencyListCell(viewModel: viewModel)
    }
}
