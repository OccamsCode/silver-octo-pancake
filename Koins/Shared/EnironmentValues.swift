//
//  EnironmentValues.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

// MARK: - Keys
private struct RouterEnvironmentKey: EnvironmentKey {
    static let defaultValue: Router = .shared
}


// MARK: - Values
extension EnvironmentValues {
    var router: Router {
        get { self[RouterEnvironmentKey.self] }
        set { self[RouterEnvironmentKey.self] = newValue }
    }
}
