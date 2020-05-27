//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class SettingsGroup: ObservableObject, Codable {

    // MARK: - Internal -

    let name: String
    @Published private(set) var settingsItems: [SettingsItem]

    init(name: String, settingsItems: [SettingsItem]) {
        self.name = name
        self.settingsItems = settingsItems
    }

    func reset() {
        for settingsItem in settingsItems.reversed() {
            if let initialValue = settingsItem.initialValue {
                settingsItem.value = initialValue
            } else {
                settingsItems.remove(element: settingsItem)
            }
        }
    }

    func add(settingsItem: SettingsItem) {
        settingsItems.append(settingsItem)
    }

    func remove(settingsItem: SettingsItem) {
        guard let index = settingsItems.firstIndex(of: settingsItem) else {
            assertionFailure()
            return
        }
        settingsItems.remove(at: index)
    }

    func removeSettingsItemWith(settingsValue: SettingsValue) {
        guard let index = settingsItems.firstIndex(where: { $0.value == settingsValue }) else {
            assertionFailure()
            return
        }
        settingsItems.remove(at: index)
    }

    enum CodingKeys: CodingKey {
        case name, settingsItems
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.settingsItems = try container.decode([SettingsItem].self, forKey: .settingsItems)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(settingsItems, forKey: .settingsItems)
    }

}
