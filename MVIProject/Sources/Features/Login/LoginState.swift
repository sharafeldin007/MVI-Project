//
//  LoginState.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//
import Foundation


struct LoginState: ViewState {
  
    typealias Value = User
    var loadingState: LoadingState<User> = .idle
    var email = ""
    var password = ""
    var isFormValid: Bool {
      email.isValidEmail && password.count >= 4
    }
}

