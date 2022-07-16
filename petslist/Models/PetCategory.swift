//
//  PetCategory.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import RealmSwift

// MARK: - Pet
final class PetCategory: Object, ObjectKeyIdentifiable, Decodable {
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var title: String?
  @Persisted var details: String?
  @Persisted var image: String?
  @Persisted var order: Int?
  @Persisted var status: String?
  @Persisted var content = RealmSwift.List<Pet>()
  
  private enum CodingKeys: String, CodingKey {
    case title, image, order, status, content
    case details = "description"
  }
  
  convenience init(title: String?, description: String?, image: String?, order: Int?, status: String?, content: [Pet]?) {
    self.init()
    
    self.title = title
    self.details = description
    self.image = image
    self.order = order
    self.status = status
    
    //init, then append
    self.content = .init()
    self.content.append(objectsIn: content ?? [])
  }
  
  public required convenience init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.title = try container.decode(String.self, forKey: .title)
    self.details = try container.decode(String.self, forKey: .details)
    self.image = try container.decode(String.self, forKey: .image)
    self.order = try container.decode(Int.self, forKey: .order)
    self.status = try container.decode(String.self, forKey: .status)
    
    print(Thread.current)
    
    let content = try? container.decode([Pet].self, forKey: .content)
    //MARK: - Decoding array of objects
    //1. Initialize list
    self.content = .init()
    //2. Append objects
    self.content.append(objectsIn: content ?? [])
    //3. Save to database. Use singleton directly for not injecting in to every model (could be 100+ models per project)
    
  }
}

extension PetCategory {
  static var mock: Self {
    .init(title: "Foo", description: "Bar", image: "Kitty", order: 0, status: "paid", content: [Pet.mock])
  }
}
