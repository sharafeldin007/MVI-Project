//
//  LoginView.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        VStack(spacing: 16) {
          TextField("Email", text: viewModel.emailBinding)
            .textFieldStyle(.roundedBorder)

          SecureField("Password", text: viewModel.passwordBinding)
            .textFieldStyle(.roundedBorder)

          switch viewModel.state.loadingState {
          case .loading:
            ProgressView()
          case .idle:
            Button("Login") {
                viewModel.send(.submit)
            }
            .disabled(!viewModel.state.isFormValid)
          case .failure(let error):
            Text(error.localizedDescription).foregroundColor(.red)
            Button("Login") {
                viewModel.send(.submit)
            }
            .disabled(!viewModel.state.isFormValid)
          case .success(_):
            Button("Login") {
                viewModel.send(.submit)
            }
            .disabled(!viewModel.state.isFormValid)
          }

        }
        .onAppear {
           viewModel.onLoginSuccess = {
            router.navigate(to: .dashboard, with: .opacity.combined(with: .scale))
          }
        }
        .padding()
    }
}
