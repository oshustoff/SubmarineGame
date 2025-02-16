//
//  UserDefaults_Extension.swift
//  Submarine
//
//  Created by Michael Shustov on 14.02.2025.
//

import Foundation
import UIKit

extension UserDefaults {
    func set<T:Encodable>(encodable: T, key: String) {
        guard let data = try? JSONEncoder().encode(encodable) else { return }
        set(data, forKey: key)
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = object(forKey: key) as? Data,
              let value = try? JSONDecoder().decode(type, from: data) else { return nil }
        return value
    }
}
