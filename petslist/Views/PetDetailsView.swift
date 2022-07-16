//
//  PetDetailsView.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI

struct PetDetailsView: View {
  let category: PetCategory
  
  var body: some View {
    VStack {
      Text("Pet's details")
      Text(category.title ?? "")
    }
  }
}

struct PetDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    PetDetailsView(category: .init())
  }
}
