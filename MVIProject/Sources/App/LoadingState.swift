//
//  LoadingState.swift
//  MVIProject
//
//  Created by Sharaf on 5/25/25.
//

import Foundation

public enum LoadingState<T> {
 
  case failure(Error)

  case idle

  case loading

  case success(T)

 
}
