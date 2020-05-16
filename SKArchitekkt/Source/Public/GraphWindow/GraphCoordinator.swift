//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

public class GraphCoordinator: SplitViewCoordinator<ModuleDependencies> {

    // MARK: - Public -

    public override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    public override func insertSplitViewItem(_ splitViewItem: NSSplitViewItem, at index: Int) {
        switch splitViewItem.viewController {
        case let settingsViewController as SettingsViewController:
            settingsViewController.settings = settings
        default:
            break
        }
        super.insertSplitViewItem(splitViewItem, at: index)
    }

    public override func splitViewDidResizeSubviews(_ notification: Notification) {
        for splitViewItem in splitViewItems {
            switch splitViewItem.viewController {
            case is SettingsViewController:
                didSetRightPane(self, visible: !splitViewItem.isCollapsed)
            default:
                break
            }
        }
    }

    // MARK: - Internal -

    enum Pane {
        case right
    }

    func setPane(visible: Bool, pane: Pane, animated: Bool) {
        switch pane {
        case .right:
            if animated {
                splitViewItems.first(where: { $0.viewController is SettingsViewController })?.animator().isCollapsed = !visible
            } else {
                splitViewItems.first(where: { $0.viewController is SettingsViewController })?.isCollapsed = !visible
            }
        }
    }

    // MARK: - Private -

    private let settings: Settings = Settings.createSettings()

    private func setUp() {
        dependencies = ModuleDependencies(settings: settings)
        splitView.delegate = self
        let rightPaneSplitViewItem = NSSplitViewItem(viewController: SettingsViewController.createFromStoryBoard())
        rightPaneSplitViewItem.canCollapse = true
        add(coordinator: NodeViewCoordinator.createFromStoryBoard())
        addSplitViewItem(rightPaneSplitViewItem)
    }

}
