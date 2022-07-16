//
//  PetCategory.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation

// MARK: - PetCategory
struct PetCategory {
  let id: UUID = .init()
  let title: String?
  let description: String?
  let image: String?
  let order: Int?
  let status: String?
  let content: [Pet]?
}

//MARK: - Conform to needed protocols
extension PetCategory: Identifiable, Decodable {}

extension PetCategory: Equatable {
  static func == (lhs: PetCategory, rhs: PetCategory) -> Bool {
    lhs.id == rhs.id
  }
}

// MARK: - Mock
extension PetCategory {
  static var mock: Self {
    .init(title: "Foo", description: "Bar", image: "Kitty", order: 0, status: "paid", content: [Pet.mock])
  }
}
