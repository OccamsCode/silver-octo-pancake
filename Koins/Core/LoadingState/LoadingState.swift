//
//  LoadingState.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import Foundation

enum LoadingState<Value>: Equatable {
    
    case idle
    case loading
    case failed(Error)
    case success(Value)
    
    static func == (lhs: LoadingState<Value>, rhs: LoadingState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.failed(_), .failed(_)): return true
        case (.success(_), .success(_)): return true
        default: return false
        }
    }
}
