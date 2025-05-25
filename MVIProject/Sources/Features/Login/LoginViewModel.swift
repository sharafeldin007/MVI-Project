//
//  LoginViewModel.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

import SwiftUI

final class LoginViewModel: ViewStore<LoginState, LoginIntent, LoginReducer> {
    private let authService: AuthService
    var onLoginSuccess: (() -> Void)?
    init(authService: AuthService = MockAuthService()) {
        self.authService = authService
        super.init(initialState: LoginState(), reducer: LoginReducer())
    }
 
  override func perform(for intent: LoginIntent) {
        guard case .submit = intent else { return }

        Task {
            do {
                let user = try await authService.login(email: state.email, password: state.password)
               send(.success(user))
                onLoginSuccess?()
            } catch {
               send(.failure(error))
            }
        }
    }
}

@MainActor
extension LoginViewModel {
    var emailBinding: Binding<String> {
        Binding(
            get: { self.state.email },
            set: { self.send(.updateEmail($0)) }
        )
    }
  
  var passwordBinding: Binding<String> {
      Binding(
        get: { self.state.password },
        set: { self.send(.updatePassword($0)) }
      )
  }
}
