//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class Settings: Codable {

    // MARK: - Internal -

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
                ])
        ]
    }

    let forceDecaySettingsItem: SettingsItem
    let velocityDecaySettingsitem: SettingsItem

    let radialGravitationalForceOnChildrenMultiplierSettingsItem: SettingsItem
    let radialGravitationalForceOnChildrenPowerSettingsItem: SettingsItem

    let negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem: SettingsItem
    let negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem

    let springForceBetweenConnectedNodesMultiplierSettingsItem: SettingsItem
    let springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem

    static func createSettings() -> Settings {
        let settings: Settings
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let s = try? JSONDecoder().decode(Settings.self, from: data) {
            settings = s
        } else {
            settings = Settings(
                forceDecaySettingsItem: SettingsItem(name: "Force", value: 0.005, minValue: 0, maxValue: 0.01),
                velocityDecaySettingsItem: SettingsItem(name: "Velocity", value: 0.1, minValue: 0, maxValue: 0.2),
                radialGravitationalForceOnChildrenMultiplierSettingsItem: SettingsItem(name: "Multiplier", value: 1, minValue: 0, maxValue: 10),
                radialGravitationalForceOnChildrenPowerSettingsItem: SettingsItem(name: "Power", value: -1.6, minValue: -3, maxValue: 3),
                negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem: SettingsItem(name: "Multiplier", value: 1, minValue: 0, maxValue: 10),
                negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem(name: "Power", value: -0.5, minValue: -3, maxValue: 3),
                springForceBetweenConnectedNodesMultiplierSettingsItem: SettingsItem(name: "Multiplier", value: 1, minValue: 0, maxValue: 10),
                springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem(name: "Power", value: 1.8, minValue: -3, maxValue: 3)
            )
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

    // MARK: - Private -

    private static let userDefaultsKey = "settingsUserDefaultsKey"
    private static var settingsItemObservations: [NSKeyValueObservation] = []

    private init(forceDecaySettingsItem: SettingsItem,
                 velocityDecaySettingsItem: SettingsItem,
                 radialGravitationalForceOnChildrenMultiplierSettingsItem: SettingsItem,
                 radialGravitationalForceOnChildrenPowerSettingsItem: SettingsItem,
                 negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem: SettingsItem,
                 negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem,
                 springForceBetweenConnectedNodesMultiplierSettingsItem: SettingsItem,
                 springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem) {
        self.forceDecaySettingsItem = forceDecaySettingsItem
        self.velocityDecaySettingsitem = velocityDecaySettingsItem
        self.radialGravitationalForceOnChildrenMultiplierSettingsItem = radialGravitationalForceOnChildrenMultiplierSettingsItem
        self.radialGravitationalForceOnChildrenPowerSettingsItem = radialGravitationalForceOnChildrenPowerSettingsItem
        self.negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem = negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem
        self.negativeRadialGravitationalForceOnSiblingsPowerSettingsItem = negativeRadialGravitationalForceOnSiblingsPowerSettingsItem
        self.springForceBetweenConnectedNodesMultiplierSettingsItem = springForceBetweenConnectedNodesMultiplierSettingsItem
        self.springForceBetweenConnectedNodesPowerSettingsItem = springForceBetweenConnectedNodesPowerSettingsItem
    }

}
