//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

final class Settings: Codable {

    // MARK: - Internal -

    static func createSettings() -> Settings {
        let settings: Settings
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let s = try? JSONDecoder().decode(Settings.self, from: data) {
            settings = s
        } else {
            settings = Settings()
        }
        settingsItemObservations = settings.settingsItems.map({ (settingsItem) -> NSKeyValueObservation in
            return settingsItem.observe(\.value) { (_, _) in
                if let data = try? JSONEncoder().encode(settings) {
                    UserDefaults.standard.set(data, forKey: userDefaultsKey)
                }
            }
        })
        return settings
    }
    
    func reset() {
        let newSettings = Settings()
        let zippedSettingsItems = zip(settingsItems, newSettings.settingsItems)
        for (settingsItem, newSettingsItem) in zippedSettingsItems {
            settingsItem.minValue = newSettingsItem.minValue
            settingsItem.value = newSettingsItem.value
            settingsItem.maxValue = newSettingsItem.maxValue
        }
    }
    
    let negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem
    let springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem
    let areaBasedOnTotalChildrensAreaMultiplierSettingsItem: SettingsItem

    var settingsItems: [SettingsItem] {
        return settingsGroups.flatMap { $0.settingsItems }
    }
    var settingsGroups: [SettingsGroup] {
        return [
            SettingsGroup(name: "Negative Radial Gravitational Force On Siblings", settingsItems: [
                negativeRadialGravitationalForceOnSiblingsPowerSettingsItem
                ]),
            SettingsGroup(name: "Spring Force Between Connected Nodes", settingsItems: [
                springForceBetweenConnectedNodesPowerSettingsItem
                ]),
            SettingsGroup(name: "Area Based On Total Childrens Area", settingsItems: [
                areaBasedOnTotalChildrensAreaMultiplierSettingsItem
                ])
        ]
    }

    // MARK: - Private -

    private static let userDefaultsKey = "settingsUserDefaultsKey"
    private static var settingsItemObservations: [NSKeyValueObservation] = []

    private init() {
        negativeRadialGravitationalForceOnSiblingsPowerSettingsItem = SettingsItem(name: "Power", value: -1.1, minValue: -2.1, maxValue: -0.1)
        springForceBetweenConnectedNodesPowerSettingsItem = SettingsItem(name: "Power", value: 2.3, minValue: 1, maxValue: 3.6)
        areaBasedOnTotalChildrensAreaMultiplierSettingsItem = SettingsItem(name: "Multiplier", value: 4, minValue: 2, maxValue: 6)
    }
}
