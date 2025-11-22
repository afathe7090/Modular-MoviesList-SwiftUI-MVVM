//
//  MoviesUseCase.swift
//  MoviesList-MVVM-SwiftUI
//
//  Created by Menaim on 05/08/2024.
//

import Combine
import Foundation
import MoviesLookups

final class MoviesUseCase: MoviesUseCaseProtocol {
  private let moviesRepository: MoviesRepositoryProtocol
  private let genresRepository: GenreRepositoryProtocol

  init(
    moviesRepository: MoviesRepositoryProtocol,
    genresRepository: GenreRepositoryProtocol
  ) {
    self.moviesRepository = moviesRepository
    self.genresRepository = genresRepository
  }

  func fetchGenres() -> AnyPublisher<[MovieGenre], Error> {
    genresRepository
      .getGenre()
      .replaceNil(with: .init())
      .map(MovieGenreMapper.map)
      .eraseToAnyPublisher()
  }

  func fetchMovies(for currentPage: Int) -> AnyPublisher<MoviesItems, Error> {
    moviesRepository
      .getMovies(for: currentPage)
      .replaceNil(with: .empty)
      .map(MovieItemsMapper.map)
      .eraseToAnyPublisher()
  }

  func search(with searchText: String, and searchPage: Int) -> AnyPublisher<MoviesItems, Error> {
    moviesRepository
      .getSearchedMovies(with: searchText, and: searchPage)
      .replaceNil(with: .empty)
      .map(MovieItemsMapper.map)
      .eraseToAnyPublisher()
  }
}
