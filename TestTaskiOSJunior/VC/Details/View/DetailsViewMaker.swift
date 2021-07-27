//
//  DetailsViewMaker.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import UIKit
import SnapKit

class DetailsViewMaker {
    
    unowned var container: DetailsVC
    
    init(container: DetailsVC) {
        self.container = container
    }
    
    lazy var weatherIcon: UIView = {
        let icon = UIView()
        
        return icon
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = WeatherLabel()
        
        return label
    }()
    
    lazy var conditionLabel: UILabel = {
        let label = WeatherLabel()
        
        return label
    }()
    
    lazy var pressureLabel: UILabel = {
        let label = WeatherLabel()
        
        return label
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = WeatherLabel()
        
        return label
    }()
    
    lazy var maxTempLabel: UILabel = {
        let label = WeatherLabel()
        
        return label
    }()
    
    lazy var minTempLabel: UILabel = {
        let label = WeatherLabel()
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = WeatherStackView()
        [
            temperatureLabel,
            conditionLabel,
            pressureLabel,
            windSpeedLabel,
            maxTempLabel,
            minTempLabel
        ]
        .forEach { stack.addArrangedSubview($0) }
        
        return stack
    }()
    
    func setupLayouts() {
        [
            weatherIcon,
            stackView
        ]
        .forEach { container.view.addSubview($0) }
        
        weatherIcon.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100)
            $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(weatherIcon.snp.bottom).offset(20)
        }
    }
}
