//
//  ViewStore.swift
//  MVIProject
//
//  Created by Sharaf on 5/23/25.
//

import Foundation

class ViewStore<State: ViewState, Intent: Intentable,
                R: Reducer>: ObservableObject
                where R.State == State, R.intent == Intent {
  
    @Published private(set) var state: State
     private let reducer: R

    init(initialState: State, reducer: R) {
        self.state = initialState
        self.reducer = reducer
    }

  @MainActor
    func send(_ intent: Intent) {
        let newState = reducer.reduce(state: state, intent: intent)
        self.state = newState
        perform(for: intent)
    }

  @MainActor
    func perform(for intent: Intent) {
        // override in subclass
    }
}
