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
}
