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
            Text("#\(coin.marketCapRank)")
                .foregroundColor(.black.opacity(0.7))
            
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
                    .font(.headline)
                
                Text(coin.marketCap.asShorthand)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // Coin Price Info
            VStack(alignment: .trailing, spacing: 5) {
                Text(coin.price.asCurrency)
                    .font(.body)
                
                Text(coin.pricePercentageChange.asPercentage)
                    .font(.subheadline)
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
