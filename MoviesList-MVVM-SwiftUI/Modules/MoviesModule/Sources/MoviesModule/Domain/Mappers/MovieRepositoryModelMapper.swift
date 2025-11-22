//
//  MovieRepositoryModelMapper.swift
//  MoviesModule
//
//  Created by Ahmed Fathy on 22/11/2025.
//
import DatabaseKit

enum MovieRepositoryModelMapper {
  static func map(_ entity: MovieEntity) -> MovieRepositoryModel {
    return MovieRepositoryModel(
      posterPath: entity.posterPath,
      title: entity.title,
      releaseDate: entity.releaseDate,
      genreIDs: Array(entity.genreIDs),
      id: Int(entity.id),
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      overview: entity.overview
    )
  }
}
