//
//  WeatherStackView.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 27.07.2021.
//

import UIKit

class WeatherStackView: UIStackView {
    
    init() {
        super.init(frame: .zero)
        self.configureSelf()
    }
    
    required init(coder: NSCoder) {
        fatalError(Constants.Error.nsCoderError)
    }
    
    private func configureSelf() {
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 10
    }
    
}
