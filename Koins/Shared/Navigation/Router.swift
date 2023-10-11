//
//  Router.swift
//  Koins
//
//  Created by Brian Munjoma on 11/10/2023.
//

import SwiftUI

final class Router: ObservableObject {
    
    var registeredRoutes: [NavigationRoute] = []
    static let shared = Router()
    
    private init() {}
    
    func register(_ route: NavigationRoute) {
        guard registeredRoutes.filter({ $0.path == route.path }).first == nil else { return }
        registeredRoutes.append(route)
    }
    
    func register(_ routes: NavigationRoute...) {
        routes.forEach { register($0) }
    }
    
    func resolve(path: RouterPath) -> some View {
        guard let route = registeredRoutes.first(where: { $0.path == path }) else { fatalError("Route for path \(path) not registered") }
        return route.render()
    }
}
