//
//  ContentView.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color("BGColor")
        .edgesIgnoringSafeArea(.top)
      Button("Load pets") {
        print("Loading pets…")
      }
      .tint(.white)
      .buttonStyle(.bordered)
      .accessibilityValue("Load pets list")
      .accessibilityHint("Do you want to load pets list? Just press button")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
