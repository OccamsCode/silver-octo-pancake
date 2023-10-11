//
//  CoinGeckoClient.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation
import Poppify

final class CoinGeckoClient: Client {
    
    var environment: EnvironmentType
    var urlSession: URLSessionType
    
    internal init(environment: EnvironmentType = Environment(scheme: .secure, endpoint: "api.coingecko.com"),
                  urlSession: URLSessionType = URLSession.shared) {
        self.environment = environment
        self.urlSession = urlSession
    }
}
