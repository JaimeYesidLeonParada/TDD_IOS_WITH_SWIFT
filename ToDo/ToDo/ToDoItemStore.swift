//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 19/08/22.
//

import Foundation
import Combine

class ToDoItemStore {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never> ([])
    
    private let fileName: String
    private var items: [ToDoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    init(fileName: String = "toDoItems") {
        self.fileName = fileName
        loadItems()
    }
    
    func add(_ item: ToDoItem) {
        items.append(item)
        saveItems()
    }
    
    func check(_ item: ToDoItem) {
        var mutableItem = item
        mutableItem.done = true
        
        if let index = items.firstIndex(of: item) {
            items[index] = mutableItem
            saveItems()
        }
    }
    
    private func saveItems() {
        let url = fileNameURL(name: fileName)
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: url)
        } catch {
            print("Error: \(error)")
        }
        
    }
    
    private func loadItems() {
        let url = fileNameURL(name: fileName)
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([ToDoItem].self, from: data)
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func fileNameURL(name: String) -> URL {
        return FileManager.default.documentsURL(name: name)
    }
}
