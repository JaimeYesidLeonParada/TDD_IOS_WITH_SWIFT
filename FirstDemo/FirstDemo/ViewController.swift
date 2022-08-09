//
//  ViewController.swift
//  FirstDemo
//
//  Created by Jaime Yesid Leon Parada on 6/08/22.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func numberOfVowels(in string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u",
                                   "A", "E", "I", "O", "U"]
//        var numberOfVowels = 0
//        
//        for character in string {
//            if vowels.contains(character) {
//                numberOfVowels += 1
//            }
//        }
//        return numberOfVowels
        
        return string.reduce(0) {
            $0 + (vowels.contains($1) ? 1 : 0)
        }
    }

}

