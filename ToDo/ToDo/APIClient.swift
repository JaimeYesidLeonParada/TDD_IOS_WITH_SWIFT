//
//  APIClient.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 25/08/22.
//

import Foundation

protocol APIClientProtocol {
    func coordinate(for: String, completion:(Coordinate?) -> Void)
}

class APIClient: APIClientProtocol {
    func coordinate(for: String, completion: (Coordinate?) -> Void) {

    }
}
