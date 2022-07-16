//
//  NetworkService.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation

protocol NetworkServiceProtocol {
  func fileData(for name: String, and type: String) async -> Data?
}

struct NetworkService: NetworkServiceProtocol {
  let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func fileData(for name: String, and type: String) async -> Data? {
    guard let urlpath = Bundle.main.path(forResource: name, ofType: ".\(type)") else { return nil }
    let url = URL(fileURLWithPath: urlpath)
    
    do {
      let (data, _) = try await session.data(from: url)
      return data
    } catch {
      debugPrint("Error loading \(url): \(String(describing: error))")
      return nil
    }
  }
}
