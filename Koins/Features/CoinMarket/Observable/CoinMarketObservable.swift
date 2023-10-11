//
//  CoinMarketObservable.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

final class CoinMarketObservable: ObservableObject {
    
    private let repository: CoinMarketRespository
    @Published private(set) var phase: LoadingState<[CoinMarket]>
    
    init(repository: CoinMarketRespository = CoinGeckoRepository(),
         phase: LoadingState<[CoinMarket]> = .idle) {
        self.repository = repository
        self.phase = phase
    }
    
    @MainActor
    func fetchAllCoins() async throws {
        phase = .loading
        let result = try await repository.fetchAllCoinsMarket()
        
        switch result {
        case .success(let success):
            phase = .success(success)
        case .failure(let failure):
            phase = .failed(failure)
        }
    }
}
