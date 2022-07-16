//
//  PetsListView.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI
import RealmSwift

struct PetsCategoriesView: View {
  @ObservedObject var pets: PetsListViewModel
  
  var body: some View {
    NavigationView {
      List(pets.categories.elements) { category in
        Text(category.title ?? .init())
      }
      .navigationTitle(.init("Pets list"))
    }
  }
}

struct PetsListView_Previews: PreviewProvider {
  static var previews: some View {
    PetsCategoriesView(pets: .init())
  }
}
