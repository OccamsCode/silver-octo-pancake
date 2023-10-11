//
//  ErrorStateView.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

struct ErrorStateView: View {
    let error: String
    var callback: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            VStack(spacing: 16) {
                Text(error)
                if let callback {
                    Button("Retry", action: callback)
                        .buttonStyle(.borderedProminent)
                }
            }
        }
        .padding(64)
        .lineLimit(3)
        .multilineTextAlignment(.center)
    }
}

struct ErrorStateView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorStateView(error: "Sorry, an Error Occured") {}
            .previewDisplayName("With Retry")
        
        ErrorStateView(error: "Sorry, an Error Occured")
            .previewDisplayName("Without Retry")
    }
}
