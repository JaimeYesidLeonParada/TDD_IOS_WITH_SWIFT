//
//  Blogger.swift
//  FirstDemo
//
//  Created by Jaime Yesid Leon Parada on 15/08/22.
//

import Foundation

struct Blogger {
    func makeHeadline(from input: String) -> String {
        return input.capitalized
    }
    
    func makeReverseString(from input: String) -> String {
        return String(input.reversed())
    }
    
    func makeFilename(from input: String) -> String{
        return input.lowercased().replacingOccurrences(of: " ", with: "_").appending(".txt")
    }
}
