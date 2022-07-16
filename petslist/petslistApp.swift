//
//  petslistApp.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI
import RealmSwift

@main
struct petslistApp: SwiftUI.App {
  var body: some Scene {
    WindowGroup {
      MainView(pets: .init())
        .environment(\.realmConfiguration, Realm.Configuration.defaultConfiguration)
    }
  }
}
