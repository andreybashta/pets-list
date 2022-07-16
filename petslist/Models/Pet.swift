//
//  Pet.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

// MARK: - Pet
struct Pet: Codable {
  let fact: String?
  let image: String?
}

// MARK: - Mock
extension Pet {
  static var mock: Self {
    .init(fact: "Fun kitty", image: nil)
  }
}
