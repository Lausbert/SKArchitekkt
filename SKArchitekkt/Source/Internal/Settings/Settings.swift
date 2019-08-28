//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class Settings: Codable {

    // MARK: - Internal -
    
    static func createSettings() -> Settings {
        let settings: Settings
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let s = try? JSONDecoder().decode(Settings.self, from: data) {
            settings = s
        } else {
            settings = createNewSettings()
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
    
    let forceDecaySettingsItem: SettingsItem
    let velocityDecaySettingsitem: SettingsItem
    
    let radialGravitationalForceOnChildrenMultiplierSettingsItem: SettingsItem
    let radialGravitationalForceOnChildrenPowerSettingsItem: SettingsItem
    
    let negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem: SettingsItem
    let negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem
    
    let springForceBetweenConnectedNodesMultiplierSettingsItem: SettingsItem
    let springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem
    
    let areaBasedOnTotalChildrensAreaMultiplierSettingsItem: SettingsItem
    let areaBasedOnTotalChildrensAreaPowerSettingsItem: SettingsItem

    var settingsItems: [SettingsItem] {
        return settingsGroups.flatMap { $0.settingsItems }
    }

    var settingsGroups: [SettingsGroup] {
        return [
            SettingsGroup(name: "Decay", settingsItems: [
                forceDecaySettingsItem,
                velocityDecaySettingsitem
                ]),
            SettingsGroup(name: "Radial Gravitational Force On Children", settingsItems: [
                radialGravitationalForceOnChildrenMultiplierSettingsItem,
                radialGravitationalForceOnChildrenPowerSettingsItem
                ]),
            SettingsGroup(name: "Negative Radial Gravitational Force On Siblings", settingsItems: [
                negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem,
                negativeRadialGravitationalForceOnSiblingsPowerSettingsItem
                ]),
            SettingsGroup(name: "Spring Force Between Connected Nodes", settingsItems: [
                springForceBetweenConnectedNodesMultiplierSettingsItem,
                springForceBetweenConnectedNodesPowerSettingsItem
                ]),
            SettingsGroup(name: "Area Based On Total Childrens Area", settingsItems: [
                areaBasedOnTotalChildrensAreaMultiplierSettingsItem,
                areaBasedOnTotalChildrensAreaPowerSettingsItem
                ])
        ]
    }
    
    func reset() {
        let newSettings = Settings.createNewSettings()
        let zippedSettingsItems = zip(settingsItems, newSettings.settingsItems)
        for (settingsItem, newSettingsItem) in zippedSettingsItems {
            settingsItem.value = newSettingsItem.value
        }
    }

    // MARK: - Private -

    private static let userDefaultsKey = "settingsUserDefaultsKey"
    private static var settingsItemObservations: [NSKeyValueObservation] = []
    
    private static func createNewSettings() -> Settings {
        return Settings(
            forceDecaySettingsItem: SettingsItem(name: "Force", value: 0.005, minValue: 0, maxValue: 0.01),
            velocityDecaySettingsItem: SettingsItem(name: "Velocity", value: 0.05, minValue: 0, maxValue: 0.1),
            radialGravitationalForceOnChildrenMultiplierSettingsItem: SettingsItem(name: "Multiplier", value: 1, minValue: 0, maxValue: 10),
            radialGravitationalForceOnChildrenPowerSettingsItem: SettingsItem(name: "Power", value: -1.4, minValue: -1.8, maxValue: -1),
            negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem: SettingsItem(name: "Multiplier", value: 1, minValue: 0, maxValue: 10),
            negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem(name: "Power", value: -1.1, minValue: -2.1, maxValue: -0.1),
            springForceBetweenConnectedNodesMultiplierSettingsItem: SettingsItem(name: "Multiplier", value: 1, minValue: 0, maxValue: 10),
            springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem(name: "Power", value: 2.3, minValue: 1, maxValue: 3.6),
            areaBasedOnTotalChildrensAreaMultiplierSettingsItem: SettingsItem(name: "Multiplier", value: 2, minValue: 1, maxValue: 3),
            areaBasedOnTotalChildrensAreaPowerSettingsItem: SettingsItem(name: "Power", value: 1, minValue: 0.5, maxValue: 1.5)
        )
    }

    private init(forceDecaySettingsItem: SettingsItem,
                 velocityDecaySettingsItem: SettingsItem,
                 radialGravitationalForceOnChildrenMultiplierSettingsItem: SettingsItem,
                 radialGravitationalForceOnChildrenPowerSettingsItem: SettingsItem,
                 negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem: SettingsItem,
                 negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem,
                 springForceBetweenConnectedNodesMultiplierSettingsItem: SettingsItem,
                 springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem,
                 areaBasedOnTotalChildrensAreaMultiplierSettingsItem: SettingsItem,
                 areaBasedOnTotalChildrensAreaPowerSettingsItem: SettingsItem
                 ) {
        self.forceDecaySettingsItem = forceDecaySettingsItem
        self.velocityDecaySettingsitem = velocityDecaySettingsItem
        self.radialGravitationalForceOnChildrenMultiplierSettingsItem = radialGravitationalForceOnChildrenMultiplierSettingsItem
        self.radialGravitationalForceOnChildrenPowerSettingsItem = radialGravitationalForceOnChildrenPowerSettingsItem
        self.negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem = negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem
        self.negativeRadialGravitationalForceOnSiblingsPowerSettingsItem = negativeRadialGravitationalForceOnSiblingsPowerSettingsItem
        self.springForceBetweenConnectedNodesMultiplierSettingsItem = springForceBetweenConnectedNodesMultiplierSettingsItem
        self.springForceBetweenConnectedNodesPowerSettingsItem = springForceBetweenConnectedNodesPowerSettingsItem
        self.areaBasedOnTotalChildrensAreaMultiplierSettingsItem = areaBasedOnTotalChildrensAreaMultiplierSettingsItem
        self.areaBasedOnTotalChildrensAreaPowerSettingsItem = areaBasedOnTotalChildrensAreaPowerSettingsItem
    }

}
