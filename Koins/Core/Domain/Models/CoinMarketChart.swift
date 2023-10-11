//
//  CoinMarketChart.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

struct CoinMarketChart {
    
    struct Plot: Identifiable {
        let date: Date
        let value: Double
        
        var id: Date { return date }
    }
    
    let thumbnailImage: URL
    let marketSymbol: String
    let currentPrice: Double
    let highestPrice: Double
    let lowestPrice: Double
    let currentDate: Date
    let priceHistory: [Plot]
}

extension CoinMarketChart {
    static var preview = CoinMarketChart(thumbnailImage: URL(string: "https://assets.coingecko.com/coins/images/12819/thumb/UniLend_Finance_logo_PNG.png?1696512611")!,
                                         marketSymbol: "BTC",
                                         currentPrice: 27675.668,
                                         highestPrice: 27984.53805572639,
                                         lowestPrice: 27619.889110632826,
                                         currentDate: .now, priceHistory: [
                                            .init(date: Date(timeIntervalSince1970: 1696708009414 / 1_000), value: 27890.631604658025),
                                            .init(date: Date(timeIntervalSince1970: 1696711601256 / 1_000), value: 27876.307273823193),
                                            .init(date: Date(timeIntervalSince1970: 1696725218808 / 1_000), value: 27702.96253787604),
                                            .init(date: Date(timeIntervalSince1970: 1696738831002 / 1_000), value: 27624.562097939088),
                                            .init(date: Date(timeIntervalSince1970: 1696742412611 / 1_000), value: 27676.4021826868),
                                            .init(date: Date(timeIntervalSince1970: 1696756057304 / 1_000), value: 27619.889110632826),
                                            .init(date: Date(timeIntervalSince1970: 1696769603714 / 1_000), value: 27748.10365174851),
                                            .init(date: Date(timeIntervalSince1970: 1696773207529 / 1_000), value: 27841.982877887764),
                                            .init(date: Date(timeIntervalSince1970: 1696786844949 / 1_000), value: 27984.53805572639),
                                            .init(date: Date(timeIntervalSince1970: 1696790414799 / 1_000), value: 27956.367599384863),
                                            .init(date: Date(timeIntervalSince1970: 1696804007194 / 1_000), value: 27940.268226458327),
                                            .init(date: Date(timeIntervalSince1970: 1696817632086 / 1_000), value: 27945.412331761243),
                                            .init(date: Date(timeIntervalSince1970: 1696821213435 / 1_000), value: 27871.811818805272),
                                            .init(date: Date(timeIntervalSince1970: 1696834856122 / 1_000), value: 27921.657949143835),
                                         ])
}
