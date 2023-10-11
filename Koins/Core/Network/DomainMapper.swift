//
//  DomainMapper.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

struct DomainMapper {
    
    static func map(_ object: RemoteCoin) -> CoinMarket {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]
        
        return CoinMarket(id: object.id,
                    marketCapRank: object.marketCapRank ?? .max,
                    thumbnailImageURL: object.image,
                    symbol: object.symbol,
                    marketCap: object.marketCap ?? 0.0,
                    price: object.currentPrice,
                    pricePercentageChange: object.priceChangePercentage24H ?? 0.0,
                    lastUpdated: formatter.date(from: object.lastUpdated) ?? .now)
    }
    
    static func map(_ coin: CoinMarket, object: RemoteCoinMarketChart) -> CoinMarketChart {
        
        var x = Double.infinity
        var y = -Double.infinity
        
        let points = object.prices.map {
            let value = $0[1]
            x = min(x, value)
            y = max(y, value)
            
            return CoinMarketChart.Plot(date: Date(timeIntervalSince1970: $0[0] / 1_000), value: value)
        }
        
        return CoinMarketChart(thumbnailImage: coin.thumbnailImageURL,
                               marketSymbol: coin.symbol,
                               currentPrice: coin.price,
                               highestPrice: y,
                               lowestPrice: x,
                               currentDate: coin.lastUpdated,
                               priceHistory: points)
    }
}
