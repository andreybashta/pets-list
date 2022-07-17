//
//  PetsCategoryRow.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI

struct PetsCategoryRow: View {
  let category: PetCategory
  
  var body: some View {
    HStack(alignment: .center) {
      AsyncImage(url: URL(string: category.image ?? "")) { image in
        image
          .resizable()
          .scaledToFill()
      } placeholder: {
        Color.gray
      }
      .frame(width: 100, height: 100)
      .cornerRadius(10)
      .clipped()
      VStack(alignment: .leading) {
        Text(category.title ?? "")
          .font(.title)
        Text(category.details ?? "")
          .font(.caption)
        Spacer()
        if category.isPremium {
          Label("Premium", systemImage: "lock")
            .foregroundColor(.accentColor)
            .font(.caption2)
        }
      }
      Spacer()
      if category.isComingSoon {
        Text("Coming soon")
          .rotationEffect(Angle.init(degrees: -45))
      }
    }
  }
}

struct PetsCategoryRow_Previews: PreviewProvider {
  static var previews: some View {
    PetsCategoryRow(category: PetCategory.mock)
  }
}
