//
//  CoinMarketChartView.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI
import Charts

struct CoinMarketChartView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Image(systemName: "bitcoinsign.circle")
                        .frame(width: 32, height: 32)
                    Text("BTC")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                Text("$22.9k")
                
                Text("10, Oct 2023")
                    .foregroundColor(.gray)
            }
            Chart {
                LineMark(x: .value("Date", 0), y: .value("Price", 123.0))
                LineMark(x: .value("Date", 1), y: .value("Price", 113.0))
                LineMark(x: .value("Date", 2), y: .value("Price", 123.0))
                LineMark(x: .value("Date", 3), y: .value("Price", 133.0))
                LineMark(x: .value("Date", 4), y: .value("Price", 143.0))
                LineMark(x: .value("Date", 5), y: .value("Price", 143.0))
                LineMark(x: .value("Date", 6), y: .value("Price", 133.0))
                LineMark(x: .value("Date", 7), y: .value("Price", 123.0))
                LineMark(x: .value("Date", 8), y: .value("Price", 133.0))
            }
            
        }
        .padding(.horizontal)
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
}

struct CoinMarketChartView_Previews: PreviewProvider {
    static var previews: some View {
        CoinMarketChartView()
    }
}
