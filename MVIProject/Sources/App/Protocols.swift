//
//  Protocols.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

import Foundation
protocol Intentable {}

protocol ViewState {
  associatedtype Value
  var loadingState: LoadingState<Value>  { get }
}

protocol Reducer {
    associatedtype State: ViewState
    associatedtype intent: Intentable

    func reduce(state: State, intent: intent) -> State
}


