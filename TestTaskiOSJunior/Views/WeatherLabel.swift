//
//  WeatherLabel.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 27.07.2021.
//

import UIKit

class WeatherLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.configureSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.Error.nsCoderError)
    }
    
    private func configureSelf() {
        self.numberOfLines = 0
        self.textAlignment = .center
        self.font = UIFont(name: "Avenir Next Medium", size: 18)
    }
    
}
