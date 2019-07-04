//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

public protocol SplitViewControllerPaneDelegate: class {
    func didSetPane(visible: Bool, pane: SplitViewController.Pane)
}

public class SplitViewController: NSSplitViewController, StoryBoardLoadable {

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

    // MARK: - Internal -

    public override func viewDidLoad() {
        super.viewDidLoad()

        splitView.delegate = self
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

}
