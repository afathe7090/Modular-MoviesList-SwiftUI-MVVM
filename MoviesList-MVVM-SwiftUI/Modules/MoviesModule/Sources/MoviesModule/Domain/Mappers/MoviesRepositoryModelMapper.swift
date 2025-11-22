//
//  MoviesRepositoryModelMapper.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//

import MANetwork

public enum MoviesRepositoryModelMapper {
  static func map(_ response: MoviesNetworkResponse) -> MoviesRepositoryModel {
    MoviesRepositoryModel(
      page: response.page,
      movies: map(response.movies ?? []),
      totalPages: response.totalPages
    )
  }

  static func map(_ response: [MovieNetworkResponse]) -> [MovieRepositoryModel] {
    response.map { movie in
      MovieRepositoryModel(
        posterPath: "\(Constants.Network.imageBaseURL)\(movie.posterPath ?? "")",
        title: movie.title,
        releaseDate: movie.releaseDate?.toDate(),
        genreIDs: movie.genreIDS,
        id: movie.id,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
        overview: movie.overview
      )
    }
  }

  /// Map
  static func map(_ movies: [MovieRepositoryModel], from page: Int = 1) -> MoviesRepositoryModel {
    MoviesRepositoryModel(
      page: page,
      movies: movies,
      totalPages: 1
    )
  }
}
