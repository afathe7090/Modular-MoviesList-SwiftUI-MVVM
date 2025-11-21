//
//  MoviesUseCase.swift
//  MoviesList-MVVM-SwiftUI
//
//  Created by Menaim on 05/08/2024.
//

import Combine
import Commons
import Foundation
import MoviesLookups

final class MoviesUseCase {
  // MARK: - Private Vars

  private var cancellable: Set<AnyCancellable> = []

  // MARK: - Dependencies

  private let moviesRepository: MoviesRepositoryProtocol
  private let genresRepository: GenreRepositoryProtocol

  init(
    moviesRepository: MoviesRepositoryProtocol,
    genresRepository: GenreRepositoryProtocol
  ) {
    self.moviesRepository = moviesRepository
    self.genresRepository = genresRepository
  }

  // MARK: - Privates

  func fetchGenres() -> AnyPublisher<[MovieGenre], ModuleError> {
    genresRepository
      .getGenre()
      .mapError(ModuleError.init)
      .replaceNil(with: .init())
      .map(MovieGenreMapper.map)
      .eraseToAnyPublisher()
  }
}

// MARK: - MoviesUseCaseProtocol

extension MoviesUseCase: MoviesUseCaseProtocol {
  func fetchMovies(for currentPage: Int) -> AnyPublisher<MoviesItems, ModuleError> {
    moviesRepository
      .getMovies(for: currentPage)
      .mapError(ModuleError.init)
      .replaceNil(with: .empty)
      .map(MovieItemsMapper.map)
      .eraseToAnyPublisher()
  }

  func search(with searchText: String, and searchPage: Int) -> AnyPublisher<MoviesItems, ModuleError> {
    moviesRepository
      .getSearchedMovies(with: searchText, and: searchPage)
      .mapError(ModuleError.init)
      .replaceNil(with: .empty)
      .map(MovieItemsMapper.map)
      .eraseToAnyPublisher()
  }
}
