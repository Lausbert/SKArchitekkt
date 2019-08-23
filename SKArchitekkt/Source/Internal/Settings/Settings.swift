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
                ])
        ]
    }
    
    let forceDecaySettingsItem: SettingsItem
    let velocityDecaySettingsitem: SettingsItem
    
    static func createSettings() -> Settings {
        let settings: Settings
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let s = try? JSONDecoder().decode(Settings.self, from: data) {
            settings = s
        } else {
            settings = Settings(
                forceDecaySettingsItem: SettingsItem(name: "Force", value: 0.005, minValue: 0, maxValue: 0.01),
                velocityDecaySettingsItem: SettingsItem(name: "Velocity", value: 0.1, minValue: 0, maxValue: 0.2)
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
                 velocityDecaySettingsItem: SettingsItem) {
        self.forceDecaySettingsItem = forceDecaySettingsItem
        self.velocityDecaySettingsitem = velocityDecaySettingsItem
    }
    
}
