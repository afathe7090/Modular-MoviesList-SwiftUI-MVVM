//
//  Publisher+.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//

import Combine

extension Publisher {
  func eraseToOptionalOutputPublisher() -> AnyPublisher<Output?, Failure> {
    map { Optional($0) }
      .eraseToAnyPublisher()
  }
}
