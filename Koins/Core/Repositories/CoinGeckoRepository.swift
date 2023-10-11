//
//  CoinGeckoRepository.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation
import Poppify

protocol CoinMarketRespository {
    func fetchAllCoinsMarket() async throws -> Result<[CoinMarket], Error>
}

final class CoinGeckoRepository {
    
    private let client: Client
    
    init(_ client: Client = CoinGeckoClient()) {
        self.client = client
    }
}

extension CoinGeckoRepository: CoinMarketRespository {
    func fetchAllCoinsMarket() async throws -> Result<[CoinMarket], Error> {
        
        let marketList = CoinGeckoRequest(path: "/api/v3/coins/markets",
                                        parameters: [
                                            URLQueryItem(name: "vs_currency", value: "usd"),
                                            URLQueryItem(name: "order", value: "market_cap_desc"),
                                            URLQueryItem(name: "per_page", value: "250"),
                                            URLQueryItem(name: "page", value: "1"),
                                            URLQueryItem(name: "price_change_percentage", value: "24h"),
                                            URLQueryItem(name: "locale", value: "en")
                                        ])
        
        let marketResource = Resource<[RemoteCoin]>(request: marketList)
        
        let result = await client.executeRequest(with: marketResource)
        
        switch result {
        case .success(let success):
            return .success( success.map { DomainMapper.map($0) })
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
