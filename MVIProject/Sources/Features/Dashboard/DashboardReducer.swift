// Handles state changes for Dashboard

struct DashboardReducer: Reducer {
    func reduce(state: DashboardState, intent: DashboardIntent) -> DashboardState {
        var state = state
        switch intent {
        case .loadWelcome:
          state.loadingState = .loading
        case let .setWelcome(message):
          state.loadingState = .success(message)
        case let .failed(error):
          state.loadingState = .failure(error)
        }
        return state
    }
}
