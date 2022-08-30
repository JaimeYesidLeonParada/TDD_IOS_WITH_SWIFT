//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 22/08/22.
//

import UIKit
import Combine

protocol ToDoItemsListViewControllerProtocol {
    func selectToDoItem(_ viewController: UIViewController, item: ToDoItem)
    func addToDoItem(_ viewController: UIViewController)
}

class ToDoItemsListViewController: UIViewController {
    enum Section {
        case todo
        case done
    }
        
    @IBOutlet weak var tableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var toDoItemStore: ToDoItemStoreProtocol?
    var delegate: ToDoItemsListViewControllerProtocol?
    
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?
    private var dataSource: UITableViewDiffableDataSource<Section, ToDoItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UITableViewDiffableDataSource<Section, ToDoItem>(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
            cell.titleLabel.text = item.title
            if let timestamp = item.timestamp {
                let date = Date(timeIntervalSince1970: timestamp)
                cell.dateLabel.text = self?.dateFormatter.string(from: date)
            }
            
            return cell
        })
        
        tableView.delegate = self
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
        token = toDoItemStore?.itemPublisher.sink(receiveValue: { [weak self] items in
            self?.items = items
            self?.update(with: items)
        })
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(_:)))
        navigationItem.rightBarButtonItem = addItem
        
        dateFormatter.dateStyle = .short
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        token = toDoItemStore?.itemPublisher.sink(receiveValue: { [weak self] items in
            self?.items = items
            self?.update(with: items)
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        token?.cancel()
    }
    
    @objc func add(_ sender: UIBarButtonItem) {
        delegate?.addToDoItem(self)
    }
    
    private func update(with items: [ToDoItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ToDoItem>()
        snapshot.appendSections([.todo, .done])
        snapshot.appendItems(
            items.filter({ false == $0.done}), toSection: .todo)
        snapshot.appendItems(
            items.filter({ $0.done}), toSection: .done)
        dataSource?.apply(snapshot)
    }
}

extension ToDoItemsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item: ToDoItem
        
        switch indexPath.section {
        case 0:
            let filteredItems = items.filter({false == $0.done})
            item = filteredItems[indexPath.row]
        default:
            let filteredItems = items.filter({ true == $0.done})
            item = filteredItems[indexPath.row]
        }
        
        delegate?.selectToDoItem(self, item: item)
    }
}
