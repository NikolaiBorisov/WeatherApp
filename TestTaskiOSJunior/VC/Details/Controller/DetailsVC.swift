//
//  DetailVC.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import UIKit
import SwiftSVG

final class DetailsVC: UIViewController {
    
    private lazy var viewMaker = DetailsViewMaker(container: self)
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBackButton()
        showData()
        viewMaker.setupLayouts()
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem(
            title: Constants.DetailsVCConstants.backButtonTitle,
            style: .plain,
            target: self,
            action: nil
        )
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        backButton.tintColor = .white
        backButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.cancelButtonFont], for: .normal)
    }
    
    private func showData() {
        title = weatherModel?.name
        guard let pressure = weatherModel?.pressureMm,
              let temperature = weatherModel?.temperatureString,
              let condition = weatherModel?.conditionString,
              let url = URL(string: "\(Constants.DetailsVCConstants.iconURL)\(weatherModel!.conditionCode)\(Constants.DetailsVCConstants.iconFormat)"),
              let windSpeed = weatherModel?.windSpeed,
              let maxTemp = weatherModel?.tempMax,
              let minTemp = weatherModel?.tempMin
        else { return }
        let icon = UIView(SVGURL: url) { image in
            image.resizeToFit(self.viewMaker.weatherIcon.bounds)
        }
        viewMaker.weatherIcon.addSubview(icon)
        viewMaker.temperatureLabel.text = "\(temperature)" + Constants.DetailsVCConstants.degrees
        viewMaker.conditionLabel.text = condition
        viewMaker.pressureLabel.text = "\(Constants.DetailsVCConstants.airPressure)\(pressure)" + Constants.DetailsVCConstants.mmHg
        viewMaker.windSpeedLabel.text = "\(Constants.DetailsVCConstants.windSpeed)\(windSpeed)" + Constants.DetailsVCConstants.ms
        viewMaker.maxTempLabel.text = "\(Constants.DetailsVCConstants.maxTemp)\(maxTemp)" + Constants.DetailsVCConstants.degrees
        viewMaker.minTempLabel.text = "\(Constants.DetailsVCConstants.minTemp)\(minTemp)" + Constants.DetailsVCConstants.degrees
    }
    
}
