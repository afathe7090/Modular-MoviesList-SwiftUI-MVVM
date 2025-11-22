//
//  GenreRepository.swift
//  MoviesList-MVVM-SwiftUI
//
//  Created by Menaim on 05/08/2024.
//

import Combine
import MANetwork

public final class GenreRepository {
  // MARK: - Vars

  private var cancellable: Set<AnyCancellable> = []
  private var client: GenreAPIClientProtocol

  public init(client: GenreAPIClientProtocol) {
    self.client = client
  }

  // MARK: - Privates

  private func convert(_ response: GenreNetworkResponse?) -> [GenreRepositoryModel]? {
    response?.genres?.compactMap { genre in
      GenreRepositoryModel(
        id: genre.id,
        name: genre.name
      )
    }
  }
}

// MARK: - GenreRepositoryProtocol

extension GenreRepository: GenreRepositoryProtocol {
  public func getGenre() -> AnyPublisher<[GenreRepositoryModel]?, Error> {
    client.getGenre()
      .map(convert)
      .mapError { $0 as Error }
      .eraseToAnyPublisher()
  }
}
