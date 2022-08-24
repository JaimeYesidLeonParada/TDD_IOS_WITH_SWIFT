//
//  ToDoItemDetailsViewController.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 24/08/22.
//

import UIKit
import MapKit

class ToDoItemDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var doneButton: UIButton!
    
    var dateFormatter = DateFormatter()
    var toDoItemStore: ToDoItemStoreProtocol?
    
    var toDoItem: ToDoItem? {
        didSet {
            titleLabel.text = toDoItem?.title
            descriptionLabel.text = toDoItem?.itemDescription
            locationLabel.text = toDoItem?.location?.name
            doneButton.isEnabled = (toDoItem?.done == false)
                        
            if let time = toDoItem?.timestamp {
                dateLabel.text = dateFormatter.string(from: Date(timeIntervalSince1970: time))
            }
            
            if let coordinate = toDoItem?.location?.coordinate {
                mapView.setCenter(CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), animated: false)
            } else {
                mapView.isHidden = true
            }
        }
    }
    
    
    @IBAction func checkItem(_ sender: UIButton) {
        if let toDoItem = toDoItem {
            toDoItemStore?.check(toDoItem)
        }
        
        doneButton.isEnabled = false
    }
}
