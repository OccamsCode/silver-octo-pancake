//
//  KoinsApp.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

@main
struct KoinsApp: App {
    
    @Environment(\.router) var router
    
    init() {
        AppRouter.registerRoutes()
    }
    
    var body: some Scene {
        WindowGroup {
            router.resolve(path: .coinMarket)
                .environmentObject(CoinMarketObservable())
        }
    }
}
