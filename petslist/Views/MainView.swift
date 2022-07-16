//
//  MainView.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI

struct MainView: View {
  @StateObject var pets: PetsListViewModel
  
  var body: some View {
    ZStack {
      Color("BGColor")
        .edgesIgnoringSafeArea(.top)
      if pets.isEmpty {
        PetsEmptyState
      }
      if !pets.isEmpty {
        PetsLoadedState
      }
    }
  }
  
  var PetsEmptyState: some View {
    Button("Load pets") {
      print("Loading pets…")
    }
    .tint(.white)
    .buttonStyle(.bordered)
    .accessibilityValue("Load pets list")
    .accessibilityHint("Do you want to load pets list? Just press button")
  }
  
  var PetsLoadedState: PetsCategoriesView {
    PetsCategoriesView(pets: pets)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(pets: .init(categories: [PetCategory.mock]))
  }
}
