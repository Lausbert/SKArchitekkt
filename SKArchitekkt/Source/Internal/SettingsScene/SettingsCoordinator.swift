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
            forceSettingsGroupsViewController.settingsGroups = settings.forceSettingsGroups
            let forceSettingsTabViewItem = NSTabViewItem(viewController: forceSettingsGroupsViewController)
            addTabViewItem(forceSettingsTabViewItem)
        } else {
            assertionFailure()
        }
    }
    
}
