//
//  Mocks.swift
//  AppTests
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation
@testable import Koins

// MARK: - Remote Coin
extension RemoteCoin {
    static var mock: RemoteCoin {
        return RemoteCoin(id: "bitcoin",
                          symbol: "btc",
                          name: "Bitcoin",
                          image: URL(string: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")!,
                          currentPrice: 27294,
                          marketCap: 531989388364,
                          marketCapRank: 1,
                          fullyDilutedValuation: 572602414339,
                          totalVolume: 11945779145,
                          high24H: 27613,
                          low24H: 27017,
                          priceChange24H: -303.1380577202872,
                          priceChangePercentage24H:  -1.09845,
                          marketCapChange24H: -7726179814.257751,
                          marketCapChangePercentage24H: -1.43153,
                          circulatingSupply: 19510531,
                          totalSupply: 21000000,
                          maxSupply: 21000000,
                          ath: 69045,
                          athChangePercentage: -60.49325,
                          athDate: "2021-11-10T14:24:11.849Z",
                          atl: 67.81,
                          atlChangePercentage: 40126.72914,
                          atlDate: "2013-07-06T00:00:00.000Z",
                          lastUpdated: "2013-07-06T00:00:00.000Z")
    }
}
