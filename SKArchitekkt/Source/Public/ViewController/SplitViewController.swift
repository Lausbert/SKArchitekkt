//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

public protocol SplitViewControllerPaneDelegate: class {
    func didSetPane(visible: Bool, pane: SplitViewController.Pane)
}

public class SplitViewController: NSSplitViewController {

    // MARK: - Public -

    public weak var paneDelegate: SplitViewControllerPaneDelegate?

    public enum Pane {
        case right
    }

    public func setPane(visible: Bool, pane: Pane, animated: Bool) {
        switch pane {
        case .right:
            if animated {
                splitViewItems.first(where: { $0.viewController is RightPaneViewController })?.animator().isCollapsed = !visible
            } else {
                splitViewItems.first(where: { $0.viewController is RightPaneViewController })?.isCollapsed = !visible
            }
        }
    }

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
                paneDelegate?.didSetPane(visible: !splitViewItem.isCollapsed, pane: .right)
            default:
                break
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
