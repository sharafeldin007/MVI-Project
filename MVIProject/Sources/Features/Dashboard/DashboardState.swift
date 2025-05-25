//
//  DashboardState.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

struct DashboardState: ViewState {
  var loadingState: LoadingState<String> = .idle
  
  typealias Value = String
    
    var message: String = "Welcome!"
    var isLoading: Bool = false
    var error: String? = nil
}
