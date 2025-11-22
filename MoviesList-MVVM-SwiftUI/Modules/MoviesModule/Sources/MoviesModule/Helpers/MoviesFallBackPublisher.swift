//
//  File.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//

import Combine
import Commons
import DatabaseKit
import MANetwork

extension Publisher where Output == MoviesNetworkResponse, Failure == SessionDataTaskError {
  func fallBack<Cache: DatabaseProtocol>(
    cacheManager: Cache, for page: Int
  ) -> AnyPublisher<MoviesRepositoryModel, RepositoryError> where Cache.T == MovieEntity {
    map(MoviesRepositoryModelMapper.map)
      .catch { _ in
        cacheManager
          .getMoviesModelPublisher(from: page)
      }
      .eraseToAnyPublisher()
  }
}
