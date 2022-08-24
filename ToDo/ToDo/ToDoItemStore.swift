//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 19/08/22.
//

import Foundation
import Combine

protocol ToDoItemStoreProtocol{
    var itemPublisher: CurrentValueSubject<[ToDoItem], Never> { get set}
    func check(_: ToDoItem)
}

class ToDoItemStore : ToDoItemStoreProtocol {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never> ([])
    
    private let fileName: String
    private var items: [ToDoItem] = [] {
        didSet {
            itemPublisher.send(items)
            saveItems()
        }
    }
    
    init(fileName: String = "toDoItems") {
        self.fileName = fileName
        loadItems()
    }
    
    func add(_ item: ToDoItem) {
        items.append(item)
    }
    
    func check(_ item: ToDoItem) {
        var mutableItem = item
        mutableItem.done = true
        
        if let index = items.firstIndex(of: item) {
            items[index] = mutableItem
        }
    }
    
    private func saveItems() {
        let url = fileNameURL(from: fileName)
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: url)
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func loadItems() {
        let url = fileNameURL(from: fileName)
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([ToDoItem].self, from: data)
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func fileNameURL(from: String) -> URL {
        return FileManager.default.documentsURL(name: from)
    }
}
