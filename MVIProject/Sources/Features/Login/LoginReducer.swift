//
//  LoginReducer.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

struct LoginReducer: Reducer {
  typealias State = LoginState
  
  typealias intent = LoginIntent
  
  func reduce(state: State, intent: intent) -> LoginState {
        var state = state
        switch intent {
        case let .updateEmail(email):
            state.email = email
        case let .updatePassword(password):
            state.password = password
        case .submit:
          state.loadingState = .loading
        case .success(let user):
          state.loadingState = .success(user)
        case let .failure(error):
          state.loadingState = .failure(error)
        }
        return state
    }
}
