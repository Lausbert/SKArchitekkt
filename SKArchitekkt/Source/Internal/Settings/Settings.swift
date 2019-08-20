//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class Settings: Codable {
    
    // MARK: - Internal -
    
    let settingsGroups: [SettingsGroup]
    
    static func makeSettings() -> Settings {
        
    }
    
    // MARK: - Private -
    
    private init(settingsGroups: [SettingsGroup]) {
        self.settingsGroups = settingsGroups
    }
    
}
