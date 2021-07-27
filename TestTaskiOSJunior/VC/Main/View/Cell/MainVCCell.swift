//
//  ListCell.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import UIKit
import SnapKit

final class MainVCCell: UITableViewCell {
    
    static let identifier = "cell"
    
    private lazy var cityNameLabel: UILabel = {
        let label = WeatherLabel()
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = WeatherLabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = WeatherStackView()
        [
            cityNameLabel,
            statusLabel
        ]
        .forEach { stack.addArrangedSubview($0) }
        
        return stack
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = WeatherLabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.Error.nsCoderError)
    }
    
    func configure(weather: Weather) {
        cityNameLabel.text = weather.name
        statusLabel.text = weather.conditionString
        temperatureLabel.text = "\(weather.temperatureString)" + Constants.TemperatureComponents.degrees
    }
    
    private func setupLayouts() {
        [
            stackView,
            temperatureLabel
        ]
        .forEach { contentView.addSubview($0) }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
}
