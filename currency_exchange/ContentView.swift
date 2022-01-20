//
//  ContentView.swift
//  currency_exchange
//
//  Created by vsocaciu on 20.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CurrencyList()
                .navigationTitle("Currency Rates")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
