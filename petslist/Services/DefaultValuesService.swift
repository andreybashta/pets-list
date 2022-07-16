//
//  DefaultValuesService.swift
//  petslist
//
//  Created by Bashta on 16.07.2022.
//

import Foundation

protocol DefaultValues {
  func set(_ value: Bool, forKey defaultName: String)
}

extension UserDefaults: DefaultValues {}
