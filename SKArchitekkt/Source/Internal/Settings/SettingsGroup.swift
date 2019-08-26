//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class SettingsGroup: Codable {

    let name: String
    let settingsItems: [SettingsItem]

    init(name: String, settingsItems: [SettingsItem]) {
        self.name = name
        self.settingsItems = settingsItems
    }

}
