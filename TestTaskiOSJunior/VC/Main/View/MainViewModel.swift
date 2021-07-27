//
//  MainViewModel.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 26.07.2021.
//

import UIKit

final class MainViewModel {
    
    let newCity = Weather()
    var citiesArray = [Weather]()
    var filteredCitiesArray = [Weather]()
    
    var citiesNameArray = [
        "Москва",
        "Санкт-Петербург",
        "Видное",
        "Самара",
        "Саратов",
        "Саранск",
        "Пенза",
        "Волгоград",
        "Уфа",
        "Екатеринбург"
    ]
    
    func getData(reloadCallBack: @escaping (() -> Void)) {
        NetworkRequest.getCityWeather(citiesArray: self.citiesNameArray) { (index, weather) in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.citiesNameArray[index]
            DispatchQueue.main.async {
                reloadCallBack()
            }
        }
    }
    
    func deleteCity(for indexPath: IndexPath, isFiltering: Bool) {
        if isFiltering {
            let selectedCity = filteredCitiesArray[indexPath.row]
            if let index = citiesArray.firstIndex(where: { $0.name == selectedCity.name} ) {
                citiesArray.remove(at: index)
            }
            filteredCitiesArray.remove(at: indexPath.row)
        } else {
            citiesArray.remove(at: indexPath.row)
        }
    }
    
}
