//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import Combine

final class Settings: Codable {

    // MARK: - Internal -

    static func createSettings() -> Settings {
        let settings: Settings
        if let data = UserDefaults.standard.data(forKey: userDefaultsKeyPrefix),
            let oldSettings = try? JSONDecoder().decode(Settings.self, from: data) {
            let newSettings = Settings()
            let zippedSettingsGroups = zip(oldSettings.settingsGroups, newSettings.settingsGroups)
            let oldSettingsItemsWithInitialValue = oldSettings.settingsItems.filter { $0.initialValue != nil }
            let newSettingsItemsWithInitialValue = newSettings.settingsItems.filter { $0.initialValue != nil }
            let zippedSettingsItemsWithInitialValue = zip(
                oldSettingsItemsWithInitialValue,
                newSettingsItemsWithInitialValue
            )
            if  oldSettings.settingsGroups.count == newSettings.settingsGroups.count,
                zippedSettingsGroups.allSatisfy({ $0.0.name == $0.1.name }),
                oldSettingsItemsWithInitialValue.count == newSettingsItemsWithInitialValue.count, zippedSettingsItemsWithInitialValue.allSatisfy({ $0.0.name == $0.1.name && $0.0.initialValue == $0.1.initialValue }) {
                settings = oldSettings
            } else {
                settings = newSettings
            }
        } else {
            settings = Settings()
        }
        cancellables = []
        cancellables += settings.settingsItems.map({ (settingsItem) -> AnyCancellable in
            settingsItem.objectWillChange.receive(on: DispatchQueue.main).sink { (_) in
                if let data = try? JSONEncoder().encode(settings) {
                    UserDefaults.standard.set(data, forKey: userDefaultsKeyPrefix)
                }
            }
        })
        cancellables += settings.settingsGroups.map({ (settingsGroup) -> AnyCancellable in
           settingsGroup.objectWillChange.receive(on: DispatchQueue.main).sink { (_) in
               if let data = try? JSONEncoder().encode(settings) {
                   UserDefaults.standard.set(data, forKey: userDefaultsKeyPrefix)
               }
           }
        })
        return settings
    }

    var settingsGroups: [SettingsGroup] {
        forceSettingsGroups + visibilitySettingsGroups
    }
    var settingsItems: [SettingsItem] {
        return settingsGroups.flatMap { $0.settingsItems }
    }

    // MARK: Force

    let decayParameterSettingsItem: SettingsItem
    let radialGravitationForceOnChildrenMultiplierSettingsItem: SettingsItem
    let negativeRadialGravitationalForceOnSiblingsPowerSettingsItem: SettingsItem
    let springForceBetweenConnectedNodesPowerSettingsItem: SettingsItem
    let areaBasedOnTotalChildrensAreaMultiplierSettingsItem: SettingsItem

    var decayParameter: Double {
        if case let .range(value, _, _) = decayParameterSettingsItem.value {
            return value
        } else {
            assertionFailure()
            return 0.5
        }
    }
    var radialGravitationForceOnChildrenMultiplier: Double {
        if case let .range(value, _, _) = radialGravitationForceOnChildrenMultiplierSettingsItem.value {
            return value
        } else {
            assertionFailure()
            return 1
        }
    }
    var negativeRadialGravitationalForceOnSiblingsPower: Double {
        if case let .range(value, _, _) = negativeRadialGravitationalForceOnSiblingsPowerSettingsItem.value {
            return value
        } else {
            assertionFailure()
            return -1.1
        }
    }
    var springForceBetweenConnectedNodesPower: Double {
        if case let .range(value, _, _) = springForceBetweenConnectedNodesPowerSettingsItem.value {
            return value
        } else {
            assertionFailure()
            return 2.3
        }
    }
    var areaBasedOnTotalChildrensAreaMultiplier: Double {
        if case let .range(value, _, _) = areaBasedOnTotalChildrensAreaMultiplierSettingsItem.value {
            return value
        } else {
            assertionFailure()
            return 4
        }
    }

    lazy var forceSettingsGroups: [SettingsGroup] = {
        return [
            SettingsGroup(name: "Friction", settingsItems: [
                decayParameterSettingsItem
                ]),
            SettingsGroup(name: "Radial Gravitational Force On Children", settingsItems: [
                radialGravitationForceOnChildrenMultiplierSettingsItem
                ]),
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
    }()

    // MARK: Visibility

    let unfoldedNodesSettingsGroup: SettingsGroup
    let hiddenNodesSettingsGroup: SettingsGroup
    let flattendedNodesSettingsGroup: SettingsGroup
    let unfoldedScopesSettingsGroup: SettingsGroup
    let hiddenScopesSettingsGroup: SettingsGroup
    let flattendedScopesSettingsGroup: SettingsGroup

    lazy var visibilitySettingsGroups: [SettingsGroup] = {
        return [
            unfoldedNodesSettingsGroup,
            hiddenNodesSettingsGroup,
            flattendedNodesSettingsGroup,
            unfoldedScopesSettingsGroup,
            hiddenScopesSettingsGroup,
            flattendedScopesSettingsGroup
        ]
    }()

    // MARK: - Private -

    private static let userDefaultsKeyPrefix = "skarchitekkt/settings/"
    private static var cancellables: [AnyCancellable] = []

    private init() {
        // Force
        let v1 = SettingsValue.range(value: 0.5, minValue: 0, maxValue: 1)
        let v2 = SettingsValue.range(value: 1, minValue: 0, maxValue: 2)
        let v3 = SettingsValue.range(value: -1.1, minValue: -2.1, maxValue: -0.1)
        let v4 = SettingsValue.range(value: 2.3, minValue: 1, maxValue: 3.6)
        let v5 = SettingsValue.range(value: 4, minValue: 2, maxValue: 6)
        decayParameterSettingsItem = SettingsItem(name: "Multiplier", value: v1, initialValue: v1)
        radialGravitationForceOnChildrenMultiplierSettingsItem = SettingsItem(name: "Multiplier", value: v2, initialValue: v2)
        negativeRadialGravitationalForceOnSiblingsPowerSettingsItem = SettingsItem(name: "Power", value: v3, initialValue: v3)
        springForceBetweenConnectedNodesPowerSettingsItem = SettingsItem(name: "Power", value: v4, initialValue: v4)
        areaBasedOnTotalChildrensAreaMultiplierSettingsItem = SettingsItem(name: "Multiplier", value: v5, initialValue: v5)
        // Visibility
        unfoldedNodesSettingsGroup = SettingsGroup(name: "Unfolded Nodes", settingsItems: [])
        hiddenNodesSettingsGroup = SettingsGroup(name: "Hidden Nodes", settingsItems: [])
        flattendedNodesSettingsGroup = SettingsGroup(name: "Flattened Nodes", settingsItems: [])
        unfoldedScopesSettingsGroup = SettingsGroup(name: "Unfolded Scopes", settingsItems: [])
        hiddenScopesSettingsGroup = SettingsGroup(name: "Hidden Scopes", settingsItems: [])
        flattendedScopesSettingsGroup = SettingsGroup(name: "Flattened Scopes", settingsItems: [])
    }

}
