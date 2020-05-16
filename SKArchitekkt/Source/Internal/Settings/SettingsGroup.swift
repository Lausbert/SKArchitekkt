//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class SettingsGroup: Codable {
    
    // MARK: - Internal -

    let name: String
    var settingsItems: [SettingsItem]

    init(name: String, settingsItems: [SettingsItem]) {
        self.name = name
        self.settingsItems = settingsItems
    }
    
    func reset() {
        for (index, settingsItem) in settingsItems.enumerated() {
            if let initialValue = settingsItem.initialValue {
                settingsItem.value = initialValue
            } else {
                settingsItems.remove(at: index)
            }
        }
    }

}
