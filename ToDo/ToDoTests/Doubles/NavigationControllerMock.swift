//
//  NavigationControllerMock.swift
//  ToDoTests
//
//  Created by Jaime Yesid Leon Parada on 29/08/22.
//

import UIKit

class NavigationControllerMock: UINavigationController {
    var lastPushedViewController: UIViewController?
    var dismissCallCount = 0
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        lastPushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissCallCount += 1
        super.dismiss(animated: flag, completion: completion)
    }
}
