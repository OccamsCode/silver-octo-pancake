//
//  CoinMarketChartObservable.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

final class CoinMarketChartObservable: ObservableObject {
    private let coin: CoinMarket
    private let respository: CoinMarketChartRespository
    @Published var phase: LoadingState<CoinMarketChart>
    
    init(coin: CoinMarket,
         respository: CoinMarketChartRespository = CoinGeckoRepository(),
         phase: LoadingState<CoinMarketChart> = .idle) {
        self.coin = coin
        self.respository = respository
        self.phase = phase
    }

    @MainActor
    func fetchCoinInformation() async throws {
        phase = .loading
        let result = try await respository.fetchMarketCharts(for: coin)
        
        switch result {
        case .success(let success):
            phase = .success(success)
        case .failure(let failure):
            phase = .failed(failure)
        }
        
    }
}
