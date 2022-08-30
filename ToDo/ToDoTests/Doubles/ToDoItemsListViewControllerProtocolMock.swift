//
//  ToDoItemsListViewControllerProtocolMock.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 23/08/22.
//

import UIKit
@testable import ToDo

class ToDoItemsListViewControllerProtocolMock: ToDoItemsListViewControllerProtocol {
    var addToDoItemCallCount = 0
    var selectToDoItemReceivedArguments: (viewController: UIViewController, item: ToDoItem)?
    
    func selectToDoItem(_ viewController: UIViewController, item: ToDoItem) {
        selectToDoItemReceivedArguments = (viewController, item)
    }
    
    func addToDoItem(_ viewController: UIViewController) {
        addToDoItemCallCount += 1
    }
}
