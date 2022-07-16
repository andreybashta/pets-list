//
//  DecoderService.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation

//MARK: - Decoder protocol
protocol DecoderServiceProtocol {
  func decode<T: Decodable>(_ data: Data) -> T?
}

//MARK: - Decoding service
struct DecoderService: DecoderServiceProtocol {
  let underhoodDecoder: UnderhoodDecoder
  
  init(underhoodDecoder: UnderhoodDecoder = JSONDecoder.init()) {
    self.underhoodDecoder = underhoodDecoder
  }
  
  func decode<T: Decodable>(_ data: Data) -> T? {
    try? underhoodDecoder.decode(T.self, from: data)
  }
}

//MARK: - Cover JSONDecoder with protocol for better testability
protocol UnderhoodDecoder {
  func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

extension JSONDecoder: UnderhoodDecoder {}
