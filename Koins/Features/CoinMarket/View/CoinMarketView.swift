//
//  CoinMarketView.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

struct CoinMarketView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<15) { index in
                    CoinMarketRowView(coin: .preview)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Markets")
        }
    }
}

struct CoinMarketView_Previews: PreviewProvider {
    static var previews: some View {
        CoinMarketView()
    }
}
