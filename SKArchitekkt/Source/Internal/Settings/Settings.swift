//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class Settings: Codable {
    
    // MARK: - Internal -
    
    var settingsGroups: [SettingsGroup] {
        return [
            SettingsGroup(name: "Decay", settingsItems: [
                forceDecayTargetSettingsItem,
                forceDecayMinSettingsItem,
                forceDecayDecaySettingsItem,
                velocityDecaySettingsitem
                ])
        ]
    }
    
    let forceDecayTargetSettingsItem: SettingsItem
    let forceDecayMinSettingsItem: SettingsItem
    let forceDecayDecaySettingsItem: SettingsItem
    let velocityDecaySettingsitem: SettingsItem
    
    static func createSettings() -> Settings {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let settings = try? JSONDecoder().decode(Settings.self, from: data) {
            return settings
        } else {
            let settings = Settings(
                forceDecayTargetSettingsItem: SettingsItem(name: "ForceDecayTarget", value: 0, minValue: 0, maxValue: 1),
                forceDecayMinSettingsItem: SettingsItem(name: "ForceDecayMin", value: 0.1, minValue: 0, maxValue: 1),
                forceDecayDecaySettingsItem: SettingsItem(name: "ForceDecayDecay", value: 0.005, minValue: 0, maxValue: 0.01),
                velocityDecaySettingsitem: SettingsItem(name: "VelocityDecay", value: 0.9, minValue: 0, maxValue: 1)
            )
            let settingsItems = settings.settingsGroups.flatMap { $0.settingsItems }
            settingsItemObservations = []
            for settingsItem in settingsItems {
                settingsItemObservations.append(settingsItem.observe(\.value) { (settingsItem, change) in
                    if let data = try? JSONEncoder().encode(settings) {
                        UserDefaults.standard.set(data, forKey: userDefaultsKey)
                    }
                })
            }
            return settings
        }
    }
    
    // MARK: - Private -
    
    private static let userDefaultsKey = "settingsUserDefaultsKey"
    private static var settingsItemObservations: [NSKeyValueObservation] = []
    
    private init(forceDecayTargetSettingsItem: SettingsItem,
                 forceDecayMinSettingsItem: SettingsItem,
                 forceDecayDecaySettingsItem: SettingsItem,
                 velocityDecaySettingsitem: SettingsItem) {
        self.forceDecayTargetSettingsItem = forceDecayTargetSettingsItem
        self.forceDecayMinSettingsItem = forceDecayMinSettingsItem
        self.forceDecayDecaySettingsItem = forceDecayDecaySettingsItem
        self.velocityDecaySettingsitem = velocityDecaySettingsitem
    }
    
}
