//
//  MoviesRepository.swift
//  MoviesList-MVVM-SwiftUI
//
//  Created by Menaim on 05/08/2024.
//

import Combine
import Commons
import DatabaseKit
import Foundation
import MANetwork

final class MoviesRepository<Cache: DatabaseProtocol> where Cache.T == MovieEntity {
  // MARK: - Vars

  private var client: MoviesAPIClientProtocol
  private let cacheManager: Cache

  init(
    client: MoviesAPIClientProtocol,
    cacheManager: Cache
  ) {
    self.client = client
    self.cacheManager = cacheManager
  }
}

extension MoviesRepository: MoviesRepositoryProtocol {
  func getMovies(for currentPage: Int) -> AnyPublisher<MoviesRepositoryModel?, RepositoryError> {
    client.getMovies(for: currentPage)
      .fallBack(cacheManager: cacheManager, for: currentPage)
      .eraseToOptionalOutputPublisher()
      .eraseToAnyPublisher()
  }

  func getSearchedMovies(
    with searchedText: String,
    and searchPage: Int
  ) -> AnyPublisher<MoviesRepositoryModel?, RepositoryError> {
    client
      .getSearchedMovies(with: searchedText, and: searchPage)
      .mapError(RepositoryError.init)
      .map(MoviesRepositoryModelMapper.map)
      .eraseToAnyPublisher()
  }
}


extension DatabaseProtocol where Self.T == MovieEntity {
  func getMoviesModelPublisher(from page: Int) -> AnyPublisher<MoviesRepositoryModel, RepositoryError> {
    getAll()
      .map(MovieRepositoryModelMapper.map)
      .eraseToMoviesRepositoryModel(for: page)
      .eraseToPublisher()
  }
}
