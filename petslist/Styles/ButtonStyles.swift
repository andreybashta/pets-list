//
//  ButtonStyles.swift
//  petslist
//
//  Created by Bashta on 17.07.2022.
//

import SwiftUI

struct RoundButton: ButtonStyle {
  static let style = RoundButton()
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .background(Color.bg)
      .foregroundColor(.white)
      .clipShape(Capsule())
  }
}
