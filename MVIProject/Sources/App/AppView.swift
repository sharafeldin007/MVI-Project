//
//  AppView.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

import SwiftUI

struct AppView: View {
    @StateObject private var router = AppRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            LoginView()
                .environmentObject(router)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .login:
                        LoginView().environmentObject(router)
                            .transition(router.transition)
                    case .dashboard:
                        DashboardView()
                            .transition(router.transition)
                    }
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    AppView()
}
