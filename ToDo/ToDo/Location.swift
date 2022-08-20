//
//  Location.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 18/08/22.
//

import Foundation

struct Location: Equatable, Codable {
    let name: String
    let coordinate: Coordinate?
    
    init(name: String, coordinate: Coordinate? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name && lhs.coordinate?.latitude == rhs.coordinate?.latitude && lhs.coordinate?.longitude == rhs.coordinate?.longitude
    }
}
