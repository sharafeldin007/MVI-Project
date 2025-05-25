// Defines the intents (actions) for Dashboard

enum DashboardIntent: Intentable {
    case loadWelcome
    case setWelcome(String)
  case failed(Error)
}

