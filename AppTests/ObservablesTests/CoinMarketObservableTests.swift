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
    
    override func setUpWithError() throws {
        
        repository = MockCoinMarketRespository()
        sut = CoinMarketObservable(repository: repository)
    }
    
    override func tearDownWithError() throws {
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

class MockCoinMarketRespository: CoinMarketRespository {
    
    var returnValue: Result<[CoinMarket], Error>?
    
    func fetchAllCoinsMarket() async throws -> Result<[CoinMarket], Error> {
        guard let value = returnValue else { fatalError("Return value in Mock is not set") }
        return value
    }
}
