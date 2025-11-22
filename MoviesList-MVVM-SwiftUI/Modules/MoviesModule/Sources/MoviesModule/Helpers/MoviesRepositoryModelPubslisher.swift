//
//  MoviesRepositoryModelPubslisher.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//
import Combine
import DatabaseKit
import MANetwork

extension MoviesRepositoryModel {
  func eraseToPublisher() -> AnyPublisher<MoviesRepositoryModel, Error> {
    Just(self)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
