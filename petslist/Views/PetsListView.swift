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
  @State private var isAlertShow = false
  @State private var isAdShow = false
  @State private var isDetailsShow = false
  @State private var selectedCategory: PetCategory?
  
  var body: some View {
    ZStack {
      Content
      if isAdShow {
        Color.gray.opacity(0.9)
        ProgressView("Displaying ad...")
          .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
      }
    }
  }
  
  var Content: some View {
    NavigationView {
      List(pets.categories.elements) { category in
        if category.isPremium {
          ZStack {
            NavigationLink("", destination: PetDetailsView(category: selectedCategory ?? PetCategory.mock), isActive: $isDetailsShow)
              .hidden()
            Button(action: {
              selectedCategory = category
              isAlertShow = true
            }) {
              PetsCategoryRow(category: category)
            }
          }
        } else {
          NavigationLink(destination: PetDetailsView(category: category)) {
            PetsCategoryRow(category: category)
          }
          .disabled(category.isComingSoon)
        }
      }
      .navigationTitle(.init("Pets list"))
    }
    .alert("Watch Ad to continue", isPresented: $isAlertShow) {
      Button("Cancel", role: .cancel) {
        isAlertShow = false
      }
      Button("Show Ad") {
        isAdShow = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          isAdShow = false
          isDetailsShow = true
        }
      }
    }
  }
}

struct PetsListView_Previews: PreviewProvider {
  static var previews: some View {
    PetsCategoriesView(pets: .init())
  }
}
