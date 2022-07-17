//
//  DatabaseService.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import RealmSwift

protocol DatabaseServiceProtocol {
  func store(_ objects: [Object])
}

final class DatabaseService: DatabaseServiceProtocol {
  init() {
    self.realm = try? Realm.init()
  }
  
  private let realm: Realm?
  
  func store(_ objects: [Object]) {
    try? realm?.write { [weak self] in
      print(Thread.current)
      self?.realm?.add(objects)
    }
  }
}
