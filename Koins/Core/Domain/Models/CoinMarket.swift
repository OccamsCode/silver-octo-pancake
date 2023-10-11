//
//  CoinMarket.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

struct CoinMarket: Identifiable, Hashable {
    
    let id: String
    let marketCapRank: Int
    let thumbnailImageURL: URL
    let symbol: String
    let marketCap: Double
    let price: Double
    let pricePercentageChange: Double
    let lastUpdated: Date
}

extension CoinMarket {
    static var preview = CoinMarket(id: "bitcoin",
                                    marketCapRank: 1,
                                    thumbnailImageURL: URL(string: "https://assets.coingecko.com/coins/images/12819/thumb/UniLend_Finance_logo_PNG.png?1696512611")!,
                                    symbol: "BTC",
                                    marketCap: 539919677463.13275,
                                    price: 27675.668,
                                    pricePercentageChange: 0.24,
                                    lastUpdated: .now)
}
