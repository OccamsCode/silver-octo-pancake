//
//  RemoteCoinMarketChart.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

struct RemoteCoinMarketChart: Codable {
    let prices, marketCaps, totalVolumes: [[Double]]

    enum CodingKeys: String, CodingKey {
        case prices
        case marketCaps = "market_caps"
        case totalVolumes = "total_volumes"
    }
}
