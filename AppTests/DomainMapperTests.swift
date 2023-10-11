//
//  AppTests.swift
//  AppTests
//
//  Created by Brian Munjoma on 11/10/2023.
//

import XCTest
@testable import Koins

final class DomainMapperTests: XCTestCase {

    func testMap_RemoteCoin_toCoin() {
        
        let remoteCoin = RemoteCoin.mock
        
        let result = DomainMapper.map(remoteCoin)
        
        XCTAssertEqual(result.id, remoteCoin.id)
        XCTAssertEqual(result.marketCapRank, remoteCoin.marketCapRank)
        XCTAssertEqual(result.thumbnailImageURL, remoteCoin.image)
        XCTAssertEqual(result.symbol, remoteCoin.symbol)
        XCTAssertEqual(result.marketCap, remoteCoin.marketCap)
        XCTAssertEqual(result.price, remoteCoin.currentPrice)
        XCTAssertEqual(result.pricePercentageChange, remoteCoin.priceChangePercentage24H)
    }
    
    func testMap_RemoteMarketChart_toCoinMarketChart() {
        
        let remoteMarketChart = RemoteCoinMarketChart.mock
        let coin = CoinMarket.preview
        
        let result = DomainMapper.map(coin, object: remoteMarketChart)
        
        XCTAssertEqual(result.thumbnailImage, coin.thumbnailImageURL)
        XCTAssertEqual(result.marketSymbol, coin.symbol)
        XCTAssertEqual(result.currentPrice, coin.price)
        XCTAssertEqual(result.currentDate, coin.lastUpdated)
        XCTAssertEqual(result.priceHistory.count, remoteMarketChart.prices.count)
    }

}
