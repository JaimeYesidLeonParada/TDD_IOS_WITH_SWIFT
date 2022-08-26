//
//  APIClientMock.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 25/08/22.
//

import Foundation

@testable import ToDo

class APIClientMock: APIClientProtocol {
    var coordinateAddress: String?
    var coordinateReturnValue: Coordinate?
    
    func coordinate(for address: String, completion: (Coordinate?) -> Void) {
        coordinateAddress = address
        completion(coordinateReturnValue)
    }
}
