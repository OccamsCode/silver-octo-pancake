//
//  Requests.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation
import Poppify

struct CoinGeckoRequest: Requestable {
    let path: String
    let parameters: [URLQueryItem]
}
