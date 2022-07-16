//
//  Pet.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import RealmSwift

// MARK: - Pet
final class Pet: Object, ObjectKeyIdentifiable, Decodable {
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var fact: String?
  @Persisted var image: String?
  
  private enum CodingKeys: CodingKey {
    case fact, image
  }
  
  convenience init(fact: String?, image: String?) {
    self.init()
    self.fact = fact
    self.image = image
  }
  
  public required convenience init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.fact = try container.decode(String.self, forKey: .fact)
    self.image = try container.decode(String.self, forKey: .image)
    
    //No need to save manually, because included as a child in some PetCategory
  }
}

// MARK: - Mock
extension Pet {
  static var mock: Self {
    .init(fact: "Fun kitty", image: nil)
  }
}

