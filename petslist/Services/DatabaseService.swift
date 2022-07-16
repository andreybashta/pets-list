//
//  DatabaseService.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import RealmSwift

protocol DatabaseServiceProtocol {
  func store(_ obj: Object)
}

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
  
  func store(_ obj: Object) {
    print(Thread.current)
    //Could crash on writing, if access Realm from incorrect thread. So used Thread.current for debugging
    try? realm?.write { [weak self] in
      self?.realm?.add(obj)
    }
  }
}
