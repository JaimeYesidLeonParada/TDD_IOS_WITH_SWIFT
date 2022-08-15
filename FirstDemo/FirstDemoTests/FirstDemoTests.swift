//
//  FirstDemoTests.swift
//  FirstDemoTests
//
//  Created by Jaime Yesid Leon Parada on 6/08/22.
//

import XCTest
@testable import FirstDemo

class FirstDemoTests: XCTestCase {

    var blogger: Blogger!
    
    override func setUpWithError() throws {
        blogger = Blogger()
    }

    override func tearDownWithError() throws {
        blogger = nil
    }

    func test_numberOVowels_whenGivenDominik_shouldReturn3(){
        let viewController = ViewController()
        
        let result = viewController.numberOfVowels(in: "Dominik")
        
        XCTAssertEqual(result, 3, "Expected 3 vowels in 'Dominik' but got \(result)")
    }
    
    func test_dictsAreEqual() {
        let dict1 = ["id": "2", "name": "foo"]
        let dict2 = ["id": "2", "name": "foo"]
                
        //XCTAssertEqual(dict1, dict2)
        DDHAssertEqual(dict1, dict2)
    }
    
    func test_keysAreEqual() {
        let dict1 = ["id": "2", "name": "foo"]
        let dict2 = ["id": "2", "name": "foo"]
        
        XCTAssertEqual(dict1.keys, dict2.keys)
    }
    
    func DDHAssertEqual<A: Equatable, B: Equatable>(_ first: [A:B], _ second: [A:B], file: StaticString = #filePath, line: UInt = #line) {
        if first == second {
            return
        }
        
        for key in first.keys {
            if first[key] != second[key] {
                let value1 = String(describing: first[key])
                let value2 = String(describing: second[key])
                let keyValue1 = "\"\(key)\": \(value1)"
                let keyValue2 = "\"\(key)\": \(value2)"
                let message = "\(keyValue1) is not equal to \(keyValue2)"
                XCTFail(message, file: file, line: line)
                
                return
            }
        }
        
        XCTAssertEqual(first.keys, second.keys, file: file, line: line)
    }
    
    
    func test_makeHeadline_shouldCapitalisePassedInString() {
        let input = "the Accessibility inspector"
        
        let result = blogger.makeHeadline(from: input)
        
        let expected = "The Accessibility Inspector"
        XCTAssertEqual(result, expected)
    }
    
    func test_makeHeadline_shouldCapitalisePassedInString_2() {
        let input = "The contextual action menu"
        
        let result = blogger.makeHeadline(from: input)
        
        let expected = "The Contextual Action Menu"
        XCTAssertEqual(result, expected)
    }
    
    func test_makeReverseAString() {
        let input = "hello"
        
        let result = blogger.makeReverseString(from: input)
        
        let expected = "olleh"
        XCTAssertEqual(result, expected)
    }
    
    func test_makeReverseAString_2() {
        let input = "hello world"
        
        let result = blogger.makeReverseString(from: input)
        
        let expected = "dlrow olleh"
        XCTAssertEqual(result, expected)
    }
    
    func test_makeAFileNameFromAHeadline() {
        let input = "jaime Leon"
        
        let result = blogger.makeFilename(from: input)
        
        let expected = "jaime_leon.txt"
        XCTAssertEqual(result, expected)
    }
    
    func test_makeAFileNameFromAHeadline_2() {
        let input = "first Demo"
        
        let result = blogger.makeFilename(from: input)
        
        let expected = "first_demo.txt"
        XCTAssertEqual(result, expected)
    }
}
