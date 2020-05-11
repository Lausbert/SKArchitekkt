//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

public class GraphCoordinator: SplitViewCoordinator<Any> {

    // MARK: - Public -

    public override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    public override func insertSplitViewItem(_ splitViewItem: NSSplitViewItem, at index: Int) {
        switch splitViewItem.viewController {
        case let nodeViewController as NodeViewController:
            nodeViewController.settings = settings
        case let rightPaneViewController as RightPaneViewController:
            rightPaneViewController.settings = settings
        default:
            break
        }
        super.insertSplitViewItem(splitViewItem, at: index)
    }

    public override func splitViewDidResizeSubviews(_ notification: Notification) {
        for splitViewItem in splitViewItems {
            switch splitViewItem.viewController {
            case is RightPaneViewController:
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
                splitViewItems.first(where: { $0.viewController is RightPaneViewController })?.animator().isCollapsed = !visible
            } else {
                splitViewItems.first(where: { $0.viewController is RightPaneViewController })?.isCollapsed = !visible
            }
        }
    }

    // MARK: - Private -

    private let settings: Settings = Settings.createSettings()

    private func setUp() {
        splitView.delegate = self
        let nodeSplitViewItem = NSSplitViewItem(viewController: NodeViewController.createFromStoryBoard())
        let rightPaneSplitViewItem = NSSplitViewItem(viewController: RightPaneViewController.createFromStoryBoard())
        rightPaneSplitViewItem.canCollapse = true
        addSplitViewItem(nodeSplitViewItem)
        addSplitViewItem(rightPaneSplitViewItem)
    }

}
