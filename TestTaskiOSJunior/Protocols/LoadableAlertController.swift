//
//  LoadableAlertController.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 26.07.2021.
//

import UIKit

protocol LoadableAlertController {
    func presentAlertController()
}

extension LoadableAlertController where Self: UIViewController {
    
    func presentAlertController() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(
                title: Constants.LoadableAlert.title,
                message: Constants.LoadableAlert.message,
                preferredStyle: .alert
            )
            alertController.addAction(
                UIAlertAction(title: Constants.LoadableAlert.cancel,
                              style: .destructive,
                              handler: nil)
            )
            self.present(alertController, animated: true)
        }
    }
    
}
