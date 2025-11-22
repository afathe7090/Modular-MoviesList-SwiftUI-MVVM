//
//  MoviesItems.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//

import Foundation

struct MoviesItems {
  let page: Int
  let movies: [MovieItem]
  let totalPages: Int

  init(
    page: Int = 0,
    movies: [MovieItem] = [],
    totalPages: Int = 0
  ) {
    self.page = page
    self.movies = movies
    self.totalPages = totalPages
  }
}

struct MovieItem {
  var posterPath: String
  var title: String
  var releaseDate: Date
  var genres: [Int]
  let id: Int
  let voteAverage: Double
  let voteCount: Int
  let overview: String
}

public struct MovieGenre {
  let id: Int
  let name: String
}
