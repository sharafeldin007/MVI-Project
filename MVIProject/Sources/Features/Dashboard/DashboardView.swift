//
//  DashboardView.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        VStack(spacing: 16) {
          switch viewModel.state.loadingState {
          case .loading:
            ProgressView("Loading...")
          case .failure(let error):
            Text(error.localizedDescription)
          case .idle:
            Text("Idle")
          case .success(let success):
            Text(success)
          }
            Button("Reload") {
                viewModel.send(.loadWelcome)
            }
        }
        .padding()
    }
}
