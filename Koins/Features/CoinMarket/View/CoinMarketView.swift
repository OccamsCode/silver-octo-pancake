//
//  CoinMarketView.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

struct CoinMarketView: View {
    
    @Environment(\.router) var router
    @EnvironmentObject var observable: CoinMarketObservable
    
    var body: some View {
        switch observable.phase {
        case .loading:
            loadingView
            
        case .failed(let error):
            ErrorStateView(error: error.localizedDescription) {
                fetchCoinMarket()
            }
            
        case .success(let coins):
            NavigationView {
                List {
                    ForEach(coins) { coin in
                        NavigationLink(destination: router.resolve(path: .coinMarketChart)
                            .navigationBarTitleDisplayMode(.inline)
                            .environmentObject(CoinMarketChartObservable(coin: coin))) {
                                CoinMarketRowView(coin: coin)
                            }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Markets")
                .refreshable {
                    fetchCoinMarket()
                }
            }
            
        case .idle:
            Color.clear
                .onAppear {
                    fetchCoinMarket()
                }
        }
    }
    
    var loadingView: some View {
        VStack {
            ForEach(0..<10) { index in
                HStack(spacing: 10) {
                    Text("Rank")
                        .font(.body)
                        .lineLimit(1)
                        .foregroundColor(.gray)
                    Color.gray.opacity(0.2)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text("Symbol")
                        Text("Market Cap")
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Current Price")
                        Text("% Change")
                    }
                }
            }
        }
        .redacted(reason: .placeholder)
        .padding(.horizontal)
    }
    
    func fetchCoinMarket() {
        Task {
            try? await observable.fetchAllCoins()
        }
    }
    
}

struct CoinMarketView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinMarketView()
                .environmentObject(CoinMarketObservable(phase: .loading))
                .previewDisplayName("Loading State")
            
            CoinMarketView()
                .environmentObject(CoinMarketObservable(phase: .success([.preview, .preview])))
                .previewDisplayName("Success State")
            
            CoinMarketView()
                .environmentObject(CoinMarketObservable(phase: .failed(NSError(domain: "0", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to Load"]))))
                .previewDisplayName("Failed State")
        }
    }
}
