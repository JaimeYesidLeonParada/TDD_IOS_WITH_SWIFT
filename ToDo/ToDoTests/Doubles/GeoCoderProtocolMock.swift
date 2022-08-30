//
//  GeoCoderProtocolMock.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 26/08/22.
//

import Foundation
@testable import ToDo
import CoreLocation

class GeoCoderProtocolMock: GeoCoderProtocol {
    var geocodeAddressString: String?
    var completionHandler: CLGeocodeCompletionHandler?
    
    func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
        geocodeAddressString = addressString
        self.completionHandler = completionHandler
    }
}
