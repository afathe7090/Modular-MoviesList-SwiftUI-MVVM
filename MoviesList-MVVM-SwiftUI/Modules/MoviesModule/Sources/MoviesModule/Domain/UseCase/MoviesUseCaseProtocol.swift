//
//  MoviesUseCaseProtocol.swift
//  MoviesList-MVVM-SwiftUI
//
//  Created by Menaim on 05/08/2024.
//

import Foundation
import Combine

protocol MoviesUseCaseProtocol {
  func fetchMovies(for currentPage: Int) -> AnyPublisher<MoviesItems, Error>
  func fetchGenres() -> AnyPublisher<[MovieGenre], Error>
  func search(with searchText: String,and searchPage: Int) -> AnyPublisher<MoviesItems, Error>
}
