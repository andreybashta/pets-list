//
//  PetsListViewModel.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import Combine

@MainActor //for publishing values to view on main thread
final class PetsListViewModel: ObservableObject {
  @Published private(set) var categories: [PetCategory]
  @Published private(set) var isFetching = false
  private let dataGetter: PetsListGetter
  
  init(categories: [PetCategory] = .init()) {
    self.categories = categories
    self.dataGetter = .init()
  }
  
  func reload() async {
    isFetching = true
    let categories = await dataGetter.pets()
    isFetching = false
    self.categories = categories
  }
}

//MARK: - Computed values
extension PetsListViewModel {
  var isEmpty: Bool {
    categories.isEmpty
  }
}

//MARK: - Viewmodel's helper to delegete networking/decoding responsibilities
fileprivate struct PetsListGetter {
  let network: NetworkServiceProtocol
  let decoder: DecoderServiceProtocol
  
  init(network: NetworkServiceProtocol = NetworkService.init(), decoder: DecoderServiceProtocol = DecoderService.init()) {
    self.network = network
    self.decoder = decoder
  }
  
  //Point, where we specity path for pets' json file
  func pets() async -> [PetCategory] {
    try? await Task.sleep(nanoseconds: 1_000_000_000) //simulate delay
    guard let data = await network.fileData(for: Endpoints.jsonDB.0, and: Endpoints.jsonDB.1) else { return [] }
    
    let items: [PetCategory] = decoder.decode(data) ?? []
    try? await Task.sleep(nanoseconds: 1_500_000_000)
    return items
  }
}
