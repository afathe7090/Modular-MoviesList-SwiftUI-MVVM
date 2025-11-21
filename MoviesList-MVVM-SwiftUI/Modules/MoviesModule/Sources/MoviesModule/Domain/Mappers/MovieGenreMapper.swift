//
//  MovieGenre.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//

import Foundation
import MoviesLookups

enum MovieGenreMapper {
  static func map(from genres: [GenreRepositoryModel]) -> [MovieGenre] {
    genres.map { genre in
      MovieGenre(
        id: genre.id ?? 00,
        name: genre.name ?? "--"
      )
    }
  }
}
