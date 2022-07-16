//
//  DatabaseService.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import RealmSwift

protocol DatabaseServiceProtocol {
  @MainActor func store(_ objects: [Object])
}

@MainActor
final class DatabaseService: DatabaseServiceProtocol {
  private static var sharedDatabase: DatabaseService = {
    DatabaseService.init()
  }()
  
  private init() {
    self.realm = try? Realm.init(configuration: Realm.Configuration.defaultConfiguration)
  }
  
  static var shared: DatabaseService {
    sharedDatabase
  }
  
  private let realm: Realm?
  
  func store(_ objects: [Object]) {
    try? realm?.write { [weak self] in
      print(Thread.current)
      self?.realm?.add(objects)
    }
  }
}
