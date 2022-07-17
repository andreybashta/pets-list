//
//  PetDetailsView.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI

struct PetDetailsView: View {
  let category: PetCategory
  @State private var petSelection: Int = 0
  
  var body: some View {
    VStack {
      if category.content.isEmpty == false {
        Content
        Controls
      }
      if category.content.isEmpty {
        Text("Sorry, this category has not any added pets yet. Try it later")
          .font(.footnote)
      }
    }
    .navigationTitle(category.title ?? "")
  }
  
  var Content: some View {
    TabView(selection: $petSelection) {
      ForEach(category.content.indices) { index in
        let pet = category.content[index]
        Text(pet.fact ?? "")
          .id(index)
      }
    }
    .tabViewStyle(.page)
  }
  
  var Controls: some View {
    HStack {
      Button {
        withAnimation { petSelection -= 1 }
      } label: {
        Image(systemName: "arrowshape.turn.up.backward")
      }
      .disabled(petSelection == 0)
      Spacer()
      Button {
        withAnimation { petSelection += 1 }
      } label: {
        Image(systemName: "arrowshape.turn.up.forward")
      }
      .disabled(petSelection == category.content.endIndex - 1)
    }
  }
}

struct PetDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    PetDetailsView(category: .init())
    PetDetailsView(category: .init(value: PetCategory.mock))
  }
}
