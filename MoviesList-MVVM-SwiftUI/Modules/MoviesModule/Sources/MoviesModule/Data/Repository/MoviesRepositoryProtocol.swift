//
//  MoviesRepositoryProtocol.swift
//  MoviesList-MVVM-SwiftUI
//
//  Created by Menaim on 05/08/2024.
//

import Combine
import MANetwork

protocol MoviesRepositoryProtocol: MoviesRepositoryGettable { }

protocol MoviesRepositoryGettable {
  func getMovies(for currentPage: Int) -> AnyPublisher<MoviesRepositoryModel?, Error>
  func getSearchedMovies(
    with searchedText: String,
    and searchPage: Int
  ) -> AnyPublisher<MoviesRepositoryModel?, Error>
}
