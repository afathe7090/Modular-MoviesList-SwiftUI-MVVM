//
//  File.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//

import Foundation

enum MovieItemsMapper {
  static func map(from repositoryItem: MoviesRepositoryModel) -> MoviesItems {
    MoviesItems(
      page: repositoryItem.page ?? 0,
      movies: mapMovieItem(from: repositoryItem.movies ?? []),
      totalPages: repositoryItem.totalPages ?? 0
    )
  }

  private static func mapMovieItem(from repositoryItem: [MovieRepositoryModel]) -> [MovieItem] {
    return repositoryItem.compactMap { movie in
      MovieItem(
        posterPath: movie.posterPath ?? "",
        title: movie.title ?? "",
        releaseDate: movie.releaseDate ?? Date(),
        genres: movie.genreIDs ?? [],
        id: movie.id ?? 0,
        voteAverage: movie.voteAverage ?? 0.0,
        voteCount: movie.voteCount ?? 0,
        overview: movie.overview ?? ""
      )
    }
  }
}
