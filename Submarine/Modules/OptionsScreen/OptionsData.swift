//
//  Options.swift
//  Submarine
//
//  Created by Michael Shustov on 13.02.2025.
//

import Foundation
import UIKit

class OptionsData: Codable {
    
    var gamerName: String
    var chosenSubmarine: String
    var volume: Int
    
    init(gamerName: String, chosenSubmarine: String, volume: Int) {
        self.gamerName = gamerName
        self.chosenSubmarine = chosenSubmarine
        self.volume = volume
    }
    
    private enum CodingKeys: String, CodingKey {
        case gamerName
        case chosenSubmarine
        case volume
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gamerName, forKey: .gamerName)
        try container.encode(chosenSubmarine, forKey: .chosenSubmarine)
        try container.encode(volume, forKey: .volume)
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gamerName = try container.decode(String.self, forKey: .gamerName)
        self.chosenSubmarine = try container.decode(String.self, forKey: .chosenSubmarine)
        self.volume = try container.decode(Int.self, forKey: .volume)
    }
    
    
    func getUDData() {
        guard let model = UserDefaults.standard.value(OptionsData.self, forKey: "options") else { return }
        self.gamerName = model.gamerName
        self.chosenSubmarine = model.chosenSubmarine
        self.volume = model.volume
    }
    
    func saveUDData() {
        UserDefaults.standard.set(encodable: self, key: "options")
    }
}

