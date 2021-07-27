//
//  AddCity.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import UIKit

extension MainVC {
    
    func addNewCityAlert(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(
            title: name,
            message: nil,
            preferredStyle: .alert
        )
        let alertAdd = UIAlertAction(title: Constants.MainVCAlert.add, style: .default) { (_) in
            if let tf = alertController.textFields?.first,
               let text = tf.text {
                completionHandler(text)
            }
        }
        alertController.addTextField { (tf) in
            tf.placeholder = placeholder
        }
        let alertCancel = UIAlertAction(title: Constants.MainVCAlert.cancel, style: .destructive)
        alertController.addAction(alertAdd)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
