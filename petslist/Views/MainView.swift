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
    .animation(.default, value: pets.categories) //for smooth transition when categories have loaded
  }
}

//MARK: - Functions
extension MainView {
  fileprivate func reloadPets() {
    Task.init(priority: .userInitiated) {
      await pets.reload()
    }
  }
}

//MARK: - Computed states
extension MainView {
  var PetsEmptyState: some View {
    VStack {
      Text("Pets list")
        .font(.largeTitle)
      Button("Press here or swipe") {
        reloadPets()
      }
      .tint(.white)
      .buttonStyle(.bordered)
      .accessibilityValue("Load pets list")
      .accessibilityHint("Do you want to load pets list? Just press button")
      if pets.isFetching {
        ProgressView("Fetching data, please wait...")
          .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
      }
      Spacer()
    }
  }
  
  var PetsLoadedState: PetsCategoriesView {
    PetsCategoriesView(pets: pets)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    //1
    MainView(pets: .init(categories: [PetCategory.mock]))
    MainView(pets: .init())
    //2
    MainView(pets: .init(categories: [PetCategory.mock]))
      .preferredColorScheme(.dark)
    MainView(pets: .init())
      .preferredColorScheme(.dark)
  }
}
