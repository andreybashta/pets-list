//
//  PetsListView.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI

struct PetsCategoriesView: View {
  @ObservedObject var pets: PetsListViewModel
  
  var body: some View {
    List(pets.categories) { category in
      Text(category.title ?? .init())
    }
  }
}

struct PetsListView_Previews: PreviewProvider {
  static var previews: some View {
    PetsCategoriesView(pets: .init())
  }
}
