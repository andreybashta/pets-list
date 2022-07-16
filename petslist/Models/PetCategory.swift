//
//  PetCategory.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

// MARK: - PetCategory
struct PetCategory: Codable {
  let title: String?
  let description: String?
  let image: String?
  let order: Int?
  let status: String?
  let content: [Pet]?
}

extension PetCategory: Identifiable {
  var id: String? { title }
}

// MARK: - Mock
extension PetCategory {
  static var mock: Self {
    .init(title: "Foo", description: "Bar", image: "Kitty", order: 0, status: "paid", content: [Pet.mock])
  }
}
