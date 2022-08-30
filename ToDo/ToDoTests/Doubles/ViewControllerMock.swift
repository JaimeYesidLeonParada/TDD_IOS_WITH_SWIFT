//
//  ViewControllerMock.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 29/08/22.
//

import UIKit

class ViewControllerMock: UIViewController {
    var lastPresented: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        lastPresented = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
