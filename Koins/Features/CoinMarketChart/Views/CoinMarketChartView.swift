//
//  CoinMarketChartView.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI
import Charts

struct CoinMarketChartView: View {
    
    @EnvironmentObject var observable: CoinMarketChartObservable
    
    var body: some View {
        switch observable.phase {
        case .loading:
            loadingView
            
        case .failed(let error):
            ErrorStateView(error: error.localizedDescription)
            
        case .success(let information):
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        AsyncImage(url: information.thumbnailImage) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 32, height: 32)
                        
                        Text(information.marketSymbol.uppercased())
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    Text(information.currentPrice.asShorthand)
                    
                    Text(information.currentDate.formatted(date: .abbreviated, time: .omitted))
                        .foregroundColor(.gray)
                }
                Chart {
                    ForEach(information.priceHistory) { datum in
                        LineMark(x: .value("Date", datum.date),
                                 y: .value("Price", datum.value))
                        
                        AreaMark(x: .value("Date", datum.date),
                                 yStart: .value("Min", minimumYPlotValue(high: information.highestPrice, low: information.lowestPrice)),
                                 yEnd: .value("Max", datum.value)
                        )
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.indigo, .clear]), startPoint: .top, endPoint: .bottom)
                        )
                        .opacity(0.4)
                    }
                }
                .chartYScale(domain: [
                    minimumYPlotValue(high: information.highestPrice, low: information.lowestPrice),
                    maximumYPlotValue(high: information.highestPrice, low: information.lowestPrice)
                ])
                .chartPlotStyle { plotContent in
                    plotContent
                        .overlay {
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.5))
                                .mask(
                                    ZStack {
                                        VStack {
                                            Spacer()
                                            Rectangle().frame(height: 1)
                                        }
                                        HStack {
                                            Spacer()
                                            Rectangle().frame(width: 0.3)
                                        }
                                    }
                                )
                        }
                }
                
            }
            .padding(.horizontal)
            
        case .idle:
            Color.clear
                .onAppear {
                    Task {
                        try? await observable.fetchCoinInformation()
                    }
                }
        }
    }
    
    var loadingView: some View {
        VStack(alignment: .leading) {
            HStack {
                Color.gray
                    .opacity(0.5)
                    .frame(width: 32, height: 32)
                    .cornerRadius(4)
                Text("Symbol")
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            
            Text("Current Price")
            Text("Curret Date")
            
            Color.gray
                .opacity(0.3)
        }
        .padding()
        .redacted(reason: .placeholder)
    }
    
    func minimumYPlotValue(high: Double, low: Double) -> Double {
        return low - ((high - low) / 8)
    }
    
    func maximumYPlotValue(high: Double, low: Double) -> Double {
        return high + ((high - low) / 8)
    }
}

struct CoinMarketChartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinMarketChartView()
                .environmentObject(CoinMarketChartObservable(coin: .preview, phase: .loading))
                .previewDisplayName("Loading State")
            
            CoinMarketChartView()
                .environmentObject(CoinMarketChartObservable(coin: .preview, phase: .success(.preview)))
                .previewDisplayName("Success State")
            
            CoinMarketChartView()
                .environmentObject(CoinMarketChartObservable(coin: .preview, phase: .failed(NSError(domain: "0", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to Load"]))))
                .previewDisplayName("Failed State")
        }
    }
}
