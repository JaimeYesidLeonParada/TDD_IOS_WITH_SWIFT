//
//  ToDoItemStoreProtocolMock.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 23/08/22.
//

import Foundation
import Combine
@testable import ToDo

class ToDoItemStoreProtocolMock: ToDoItemStoreProtocol {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    var checkLastCallArgument: ToDoItem?
    
    func check(_ item: ToDoItem) {
        checkLastCallArgument = item
    }
    

    
}
