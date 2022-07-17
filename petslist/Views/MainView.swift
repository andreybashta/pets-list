//
//  MainView.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI
import RealmSwift

struct MainView: View {
  @StateObject var pets: PetsListViewModel
  @AppStorage(DefaultKeys.isJSONLoaded) var isPetsLoaded: Bool = false
  
  var body: some View {
    ZStack {
      Color.bg
        .edgesIgnoringSafeArea(.top)
      if !isPetsLoaded {
        PetsEmptyState
      }
      if isPetsLoaded {
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
      Button("Press here to download") {
        reloadPets()
      }
      .tint(.white)
      .buttonStyle(.bordered)
      .opacity(pets.isFetching ? 0.5 : 1)
      .disabled(pets.isFetching) //to not allow user sending multiple requests
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
    MainView(pets: .init())
    MainView(pets: .init())
      .preferredColorScheme(.dark)
  }
}
