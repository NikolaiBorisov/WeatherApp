//
//  Constants.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import UIKit

enum Constants {
    
    enum Error {
        static let nsCoderError = "init(coder:) has not been implemented"
    }
    
    enum TemperatureComponents {
        static let degrees = "ºC"
    }
    
    enum LoadableAlert {
        static let title = "Ошибка"
        static let message = "Вы не ввели город или такой город не существует.\nПроверьте название города"
        static let cancel = "Закрыть"
    }
    
    enum MainVCAlert {
        static let add = "Добавить"
        static let cancel = "Отменить"
    }
    
    enum MainVCConstants {
        static let backButtonTitle = "Закрыть"
        static let alertTitle = "Добавить Город"
        static let tfPlaceholder = "Введите название города"
        static let searchBarPlaceholder = "Поиск..."
        static let cellRowHeight: CGFloat = 70.0
        static let deleteTitle = "Удалить"
        static let closeAlert = "Закрыть"
        static let vcTitle = "Погода"
    }
    
    enum DetailsVCConstants {
        static let backButtonTitle = "Назад"
        static let iconURL = "https://yastatic.net/weather/i/icons/blueye/color/svg/"
        static let iconFormat = ".svg"
        static let degrees = "ºC"
        static let mmHg = " мм.рт.ст."
        static let ms = " м/с"
        static let airPressure = "Атмосферное давление: "
        static let windSpeed = "Скорость ветра: "
        static let maxTemp = "Макс.температура: "
        static let minTemp = "Мин.температура: "
    }
    
}

