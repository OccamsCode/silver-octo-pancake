//
//  AppRouter.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

struct AppRouter {
    static func registerRoutes() {
        Router.shared.register(NavigationRoute(path: .coinMarket, destination: CoinMarketView()))
    }
}
