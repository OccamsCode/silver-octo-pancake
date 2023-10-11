//
//  NavigationRoute.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

struct NavigationRoute {
    let path: RouterPath
    let destination: any View
    
    init(path: RouterPath, destination: any View) {
        self.path = path
        self.destination = destination
    }
    
    func render() -> some View {
        AnyView(destination)
    }
}
