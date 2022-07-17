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
        VStack {
          ZStack {
            Color.bg
              .cornerRadius(16)
            Content
          }
          .padding()
          Controls
            .padding(.horizontal)
            .padding(.bottom)
        }
      }
      if category.content.isEmpty {
        Text("Sorry, this category has not any added pets yet. Try it later")
          .font(.footnote)
      }
    }
    .navigationTitle(category.title ?? "")
  }
  
  var Content: some View {
    GeometryReader { geo in
      TabView(selection: $petSelection) {
        ForEach(category.content.indices) { index in
          let pet = category.content[index]
          VStack {
            AsyncImage(url: URL(string: pet.image ?? "")) { image in
              image
                .resizable()
                .scaledToFit()
            } placeholder: {
              Color.gray
                .cornerRadius(16)
            }
            .frame(height: geo.size.height / 2)
            .padding()
            .clipped()
            Text(pet.fact ?? "")
              .foregroundColor(.white)
              .bold()
              .multilineTextAlignment(.center)
              .padding(.horizontal)
            Spacer()
          }
          .id(index)
        }
      }
      .tabViewStyle(.page)
    }
  }
  
  var Controls: some View {
    HStack {
      Button {
        withAnimation { petSelection -= 1 }
      } label: {
        Image(systemName: "arrowshape.turn.up.backward")
      }
      .buttonStyle(RoundButton.style)
      .disabled(petSelection == 0)
      Spacer()
      Button {
        withAnimation { petSelection += 1 }
      } label: {
        Image(systemName: "arrowshape.turn.up.forward")
      }
      .buttonStyle(RoundButton.style)
      .disabled(petSelection == category.content.endIndex - 1)
    }
  }
}

struct PetDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    //PetDetailsView(category: .init())
    PetDetailsView(category: .init(value: PetCategory.mock))
  }
}
