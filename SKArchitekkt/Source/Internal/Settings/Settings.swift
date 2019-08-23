//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class Settings: Codable {
    
    // MARK: - Internal -
    
    var settingsGroups: [SettingsGroup] {
        return [
            SettingsGroup(name: "ForceDecay", settingsItems: [
                forceDecayAlphaSettingsItem,
                forceDecayTargetSettingsItem,
                forceDecayMinSettingsItem,
                ]),
            SettingsGroup(name: "VelocityDecay", settingsItems: [
                velocityDecayBetaSettingsitem
                ])
        ]
    }
    
    let forceDecayAlphaSettingsItem: SettingsItem
    let forceDecayTargetSettingsItem: SettingsItem
    let forceDecayMinSettingsItem: SettingsItem
    
    let velocityDecayBetaSettingsitem: SettingsItem
    
    static func createSettings() -> Settings {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let settings = try? JSONDecoder().decode(Settings.self, from: data) {
            return settings
        } else {
            let settings = Settings(
                forceDecayAlphaSettingsItem: SettingsItem(name: "Alpha", value: 0.005, minValue: 0, maxValue: 0.01),
                forceDecayTargetSettingsItem: SettingsItem(name: "Target", value: 0, minValue: 0, maxValue: 1),
                forceDecayMinSettingsItem: SettingsItem(name: "Minimum", value: 0.1, minValue: 0, maxValue: 1),
                velocityDecayBetaSettingsitem: SettingsItem(name: "Beta", value: 0.9, minValue: 0, maxValue: 1)
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
    
    private init(forceDecayAlphaSettingsItem: SettingsItem,
                 forceDecayTargetSettingsItem: SettingsItem,
                 forceDecayMinSettingsItem: SettingsItem,
                 velocityDecayBetaSettingsitem: SettingsItem) {
        self.forceDecayAlphaSettingsItem = forceDecayAlphaSettingsItem
        self.forceDecayTargetSettingsItem = forceDecayTargetSettingsItem
        self.forceDecayMinSettingsItem = forceDecayMinSettingsItem
        self.velocityDecayBetaSettingsitem = velocityDecayBetaSettingsitem
    }
    
}
