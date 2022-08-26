//
//  ToDoItemData.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 25/08/22.
//

import Foundation

class ToDoItemData: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var withDate = false
    @Published var itemDescription = ""
    @Published var locationName = ""
    @Published var addressString = ""
}
