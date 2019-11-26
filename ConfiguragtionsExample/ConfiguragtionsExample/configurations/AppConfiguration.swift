//
//  AppConfiguration.swift
//
//
//  Created by Moath_Othman on 1/27/19.
//  Copyright © 2019 Moath Othman. All rights reserved.
//

import Foundation

enum AppConfigurationsKey: String {
    case colorName
}

class AppConfigurations {

    private var configurations: [String: Any] = [:]

    init() {
        let appInfoDictionary = Bundle.main.infoDictionary
        guard let enviromentKey = appInfoDictionary?["Environment"] as? String else {
            fatalError()
        }
        let bundle = Bundle.main
        let configPath = bundle.path(forResource: "configurations", ofType: "plist")!
        let config = NSDictionary(contentsOfFile: configPath)!.value(forKey: enviromentKey)
        self.configurations = config as? [String : Any] ?? [:]
    }

    func get<T>(key: AppConfigurationsKey) -> T {
        guard let configurationValue = configurations[key.rawValue] as? T else {
            fatalError("there is no configuration for \(key.rawValue), make sure it exist in configurations.plist")
        }
        return configurationValue
    }

    subscript<T>(key: AppConfigurationsKey) -> T {
        guard let configurationValue = configurations[key.rawValue] as? T else {
            fatalError("there is no configuration for \(key.rawValue), make sure it exist in config.plist")
        }
        return configurationValue
    }
}
