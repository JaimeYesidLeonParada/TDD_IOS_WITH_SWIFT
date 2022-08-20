//
//  FileManagerExtension.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 20/08/22.
//

import Foundation

extension FileManager {
    func documentsURL(name: String) -> URL {
        guard let documentsURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError()
        }
        
        return documentsURL.appendingPathComponent(name)
    }
}
