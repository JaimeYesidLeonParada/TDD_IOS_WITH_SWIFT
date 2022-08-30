//
//  ToDoItemCell.swift
//  ToDo
//
//  Created by Jaime Yesid Leon Parada on 23/08/22.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    let titleLabel: UILabel
    let dateLabel: UILabel
    let locationLabel: UILabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        dateLabel = UILabel()
        dateLabel.textAlignment = .right
        locationLabel = UILabel()
        
        let titleLocation = UIStackView(arrangedSubviews: [titleLabel, locationLabel])
        titleLocation.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [titleLocation, dateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                                     stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
