//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

public class GraphWindowController: NSWindowController {

    // MARK: - Public -

    public override func didLoadContentViewController() {
        super.didLoadContentViewController()
        setUp()
    }

    // MARK: - Internal -

    @IBOutlet weak var paneSegmentedControl: NSSegmentedControl!

    var graphCoordinator: GraphCoordinator? { return child() }

    @IBAction func didPressPaneToolbarItem(_ paneSegmentedControl: NSSegmentedControl) {
        let selectedSegment = paneSegmentedControl.selectedSegment
        let isSelected = paneSegmentedControl.isSelected(forSegment: selectedSegment)
        switch selectedSegment {
        case 0:
            UserDefaults.standard.set(isSelected, forKey: isRightPaneVisibleKey)
            graphCoordinator?.setPane(visible: isSelected, pane: .right, animated: true)
        default:
            break
        }
    }

    override func didSetRightPane(_ sender: Any?, visible: Bool) {
        UserDefaults.standard.set(visible, forKey: isRightPaneVisibleKey)
        paneSegmentedControl.setSelected(visible, forSegment: 0)
    }

    // MARK: - Private -

    private let isRightPaneVisibleKey = "isRightPaneVisible"

    private func setUp() {
        let userDefaults = UserDefaults.standard
        userDefaults.register(defaults: [isRightPaneVisibleKey: false])
        let isRightPaneVisible = userDefaults.bool(forKey: isRightPaneVisibleKey)
        graphCoordinator?.setPane(visible: isRightPaneVisible, pane: .right, animated: false)
        paneSegmentedControl.setSelected(isRightPaneVisible, forSegment: 0)
    }
}
