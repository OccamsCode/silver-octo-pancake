//
//  CoinMarketObservableTests.swift
//  AppTests
//
//  Created by Brian Munjoma on 11/10/2023.
//

import XCTest
@testable import Koins

final class CoinMarketObservableTests: XCTestCase {
    
    var sut: CoinMarketObservable!
    private var repository: MockCoinMarketRespository!
    
    override func setUp() {
        
        repository = MockCoinMarketRespository()
        sut = CoinMarketObservable(repository: repository)
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
        
        repository.returnValue = .success([])
        
        let _ = try? await sut.fetchAllCoins()
        
        XCTAssertEqual(sut.phase, .success([]))
    }
    
    func testLoadRepository_repositoryFaulire_loadingStateIsFailed() async {
        
        let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Error"])
        repository.returnValue = .failure(error)
        
        let _ = try? await sut.fetchAllCoins()
        
        XCTAssertEqual(sut.phase, .failed(error))
    }
}
