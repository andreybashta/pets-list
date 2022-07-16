//
//  PetsListViewModel.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation
import Combine
import RealmSwift

@MainActor //for publishing values to view on main thread
final class PetsListViewModel: ObservableObject {
  @ObservedResults(PetCategory.self) var categories
  @Published private(set) var isFetching = false
  private let petsService: PetsListService
  
  init() {
    self.petsService = .init()
  }
  
  func reload() async {
    //1. Start fetching
    isFetching = true

    //2. Get data
    let categories = await petsService.loadPets()

    //3. Stop fetchin animation
    isFetching = false

    //4. Set isLoaded flag to standard storage
    petsService.defaultValues.set(true, forKey: DefaultKeys.isJSONLoaded)

    //5. Data is automatically displayed to user thanks to @ObservedResults property
    DatabaseService.shared.store(categories)
  }
}

//MARK: - Viewmodel's helper to delegete networking/decoding responsibilities
fileprivate struct PetsListService {
  let network: NetworkServiceProtocol
  let decoder: DecoderServiceProtocol
  let defaultValues: DefaultValues
  
  init(network: NetworkServiceProtocol = NetworkService.init(),
       decoder: DecoderServiceProtocol = DecoderService.init(),
       defaultValues: DefaultValues = UserDefaults.standard
  ) {
    self.network = network
    self.decoder = decoder
    self.defaultValues = defaultValues
  }
  
  //Point, where we specity path for pets' json file  
  func loadPets() async -> [PetCategory] {
    try? await Task.sleep(nanoseconds: 1_000_000_000) //simulate delay
    guard let data = await network.fileData(for: Endpoints.jsonDB.0, and: Endpoints.jsonDB.1) else { return [] }
    let items: [PetCategory] = decoder.decode(data) ?? []
    try? await Task.sleep(nanoseconds: 1_500_000_000)
    return items
  }
}
