//
//  ToDoItemInputViewDelegateMock.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 25/08/22.
//

import Foundation
@testable import ToDo

class ToDoItemInputViewDelegateMock: ToDoItemInputViewDelegate {
    var lastToDoItemData: ToDoItemData?
    var lastCoordinate: Coordinate?
    
    func addToDoItem(with data: ToDoItemData, coordinate: Coordinate?) {
        lastToDoItemData = data
        lastCoordinate = coordinate
    }
}
