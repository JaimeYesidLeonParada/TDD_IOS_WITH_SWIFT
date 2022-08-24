//
//  ToDoItemCellTests.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 23/08/22.
//

import XCTest
@testable import ToDo

class ToDoItemCellTests: XCTestCase {
    var sut: ToDoItemCell!

    override func setUpWithError() throws {
        sut = ToDoItemCell()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_hasTitleLabelSubview() {
        let subview = sut.titleLabel
        
        XCTAssertTrue(subview.isDescendant(of: sut.contentView))
    }
    
    func test_hasDateLabelSubView() {
        let subview = sut.dateLabel
        XCTAssertTrue(subview.isDescendant(of: sut.contentView))
    }
    
    func test_hasLocationLabelSubView() {
        let subview = sut.locationLabel
        XCTAssertTrue(subview.isDescendant(of: sut.contentView))
    }
    

}
