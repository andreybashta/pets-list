//
//  PetsListViewModel.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import Combine

@MainActor
final class PetsListViewModel: ObservableObject {
  @Published private(set) var categories: [PetCategory]
  
  init(categories: [PetCategory] = .init()) {
    self.categories = categories
  }
  
  func reload() async {
  }
}

//MARK: - Computed values
extension PetsListViewModel {
  var isEmpty: Bool {
    categories.isEmpty
  }
}
