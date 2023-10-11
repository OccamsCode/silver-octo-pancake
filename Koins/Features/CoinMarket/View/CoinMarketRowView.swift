//
//  CoinMarketRowView.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

struct CoinMarketRowView: View {
    var body: some View {
        HStack {
            
            // Market Cap
            Text("# 1")
            
            // Image
            Image(systemName: "bitcoinsign.circle")
                .resizable()
                .frame(width: 32, height: 32)
            
            // Coin Name Info
            VStack(alignment: .leading, spacing: 5) {
                Text("BTC")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("$441.4B")
                    .font(.caption)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // Coin Price Info
            VStack(alignment: .trailing, spacing: 5) {
                Text("$22,900.00")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("0.3%")
                    .font(.caption)
                    .foregroundColor(.green)
            }
        }
    }
}

struct CoinMarketRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinMarketRowView()
    }
}
