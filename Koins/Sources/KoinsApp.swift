//
//  KoinsApp.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

@main
struct KoinsApp: App {
    
    @StateObject var observable = CoinMarketObservable()
    
    var body: some Scene {
        WindowGroup {
            CoinMarketView()
                .environmentObject(observable)
        }
    }
}
