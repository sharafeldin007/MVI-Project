//
//  AppRouter.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case login
    case dashboard
}

class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var transition: AnyTransition = .identity

  @MainActor
    func navigate(to route: Route, with transition: AnyTransition = .move(edge: .trailing)) {
        self.transition = transition
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func reset() {
        path.removeLast(path.count)
    }
}
