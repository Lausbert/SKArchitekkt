// Copyright © 2020 Stephan Lerner. All rights reserved.

import CoreArchitekkt

class SettingsCoordinator: TabViewCoordinator<HasSettings> {
    
    // MARK: - Internal -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    // MARK: - Private -
    
    private func setUp() {
        if let settings = dependencies?.settings {
            let forceSettingsGroupsViewController = SettingsGroupsViewController.createFromStoryBoard()
            _ = forceSettingsGroupsViewController.view
            forceSettingsGroupsViewController.settingsGroups = settings.forceSettingsGroups
            let forceSettingsTabViewItem = NSTabViewItem(viewController: forceSettingsGroupsViewController)
            addTabViewItem(forceSettingsTabViewItem)
            let visibilitySettingsGroupsViewController = SettingsGroupsViewController.createFromStoryBoard()
            _ = visibilitySettingsGroupsViewController.view
            visibilitySettingsGroupsViewController.settingsGroups = settings.visibilitySettingsGroups
            let visibilitySettingsTabViewItem = NSTabViewItem(viewController: visibilitySettingsGroupsViewController)
            addTabViewItem(visibilitySettingsTabViewItem)
        } else {
            assertionFailure()
        }
    }
    
}
