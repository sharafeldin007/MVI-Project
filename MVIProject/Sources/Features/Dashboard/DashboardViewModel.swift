//
//  DashboardViewModel.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

final class DashboardViewModel: ViewStore<DashboardState, DashboardIntent, DashboardReducer> {
    init() {
        super.init(initialState: DashboardState(), reducer: DashboardReducer())
    }

  override func perform(for intent: DashboardIntent) {
        guard case .loadWelcome = intent else { return }

        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
           send(.setWelcome("Hello from Dashboard!"))
        }
    }
}
