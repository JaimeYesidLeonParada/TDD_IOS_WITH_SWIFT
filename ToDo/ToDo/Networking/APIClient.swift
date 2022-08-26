//
//  APIClient.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 25/08/22.
//

import Foundation
import CoreLocation

protocol APIClientProtocol {
    func coordinate(for: String, completion: @escaping (Coordinate?) -> Void)
}

protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

protocol GeoCoderProtocol {
    func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler)
}

class APIClient: APIClientProtocol {
    lazy var geoCoder: GeoCoderProtocol = CLGeocoder()
    lazy var session: URLSessionProtocol = URLSession.shared
    
    func coordinate(for address: String, completion: @escaping (Coordinate?) -> Void) {
        geoCoder.geocodeAddressString(address) {  placemarks, error in
            guard let clCoordinate = placemarks?.first?.location?.coordinate else {
                completion(nil)
                return
            }
            let coordinate = Coordinate(latitude: clCoordinate.latitude, longitude: clCoordinate.longitude)
            completion(coordinate)
        }
    }
    
    func toDoItems() async throws -> [ToDoItem] {
        guard let url = URL(string: "http://toodoo.app/items") else {
            return []
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request, delegate: nil)
        let items = try JSONDecoder().decode([ToDoItem].self, from: data)
        
        return items
    }
}

extension CLGeocoder: GeoCoderProtocol {}

extension URLSession: URLSessionProtocol {}
