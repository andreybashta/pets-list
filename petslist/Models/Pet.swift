//
//  Pet.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation

// MARK: - Pet
struct Pet {
  let id: UUID = .init()
  let fact: String?
  let image: String?
}

extension Pet: Decodable {}

// MARK: - Mock
extension Pet {
  static var mock: Self {
    .init(fact: "Fun kitty", image: nil)
  }
}
