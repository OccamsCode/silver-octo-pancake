//
//  CoinMarketRowView.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

struct CoinMarketRowView: View {
    let coin: CoinMarket
    var body: some View {
        HStack {
            
            // Market Cap Rank
            Text("# \(coin.marketCapRank)")
            
            // Image
            AsyncImage(url: coin.thumbnailImageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 32, height: 32)
            
            // Coin Name Info
            VStack(alignment: .leading, spacing: 5) {
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.marketCap.asShorthand)
                    .font(.caption)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // Coin Price Info
            VStack(alignment: .trailing, spacing: 5) {
                Text(coin.price.asCurrency)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.pricePercentageChange.asPercentage)
                    .font(.caption)
                    .foregroundColor(coin.pricePercentageChange > 0.0 ? .green : .red)
            }
        }
    }
}

struct CoinMarketRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinMarketRowView(coin: .preview)
    }
}
