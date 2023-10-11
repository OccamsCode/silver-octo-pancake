//
//  CoinMarketChartObservableTests.swift
//  AppTests
//
//  Created by Brian Munjoma on 11/10/2023.
//

import XCTest
@testable import Koins

final class CoinMarketChartObservableTests: XCTestCase {
    
    var sut: CoinMarketChartObservable!
    private var repository: MockCoinMarketChartRespository!
    
    override func setUp() {
        
        repository = MockCoinMarketChartRespository()
        sut = CoinMarketChartObservable(coin: CoinMarket.mock, respository: repository)
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
    }

    func testInitialObservable_loadingState_isIdle() {
        
        let result = sut.phase
        XCTAssertEqual(result, .idle)
    }

    func testLoadRepository_repositorySuccess_loadingStateIsSuccess() async {
        
        repository.returnValue = .success(CoinMarketChart.mock)
        
        let _ = try? await sut.fetchCoinInformation()
        
        XCTAssertEqual(sut.phase, .success(CoinMarketChart.mock))
    }
    
    func testLoadRepository_repositoryFaulire_loadingStateIsFailed() async {
        
        let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Error"])
        repository.returnValue = .failure(error)
        
        let _ = try? await sut.fetchCoinInformation()
        
        XCTAssertEqual(sut.phase, .failed(error))
    }
}
